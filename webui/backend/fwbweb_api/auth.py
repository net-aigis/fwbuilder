from __future__ import annotations

from dataclasses import dataclass
from pathlib import Path

from fastapi import Depends, HTTPException, status
from fastapi.security import HTTPAuthorizationCredentials, HTTPBearer

from .settings import settings

_bearer = HTTPBearer(auto_error=False)


@dataclass(frozen=True, slots=True)
class Principal:
    """Authenticated API caller."""

    token: str
    name: str
    method: str = "token"  # "token" | "oidc"


def _load_users_file(path: Path) -> dict[str, str]:
    """Parse token→name map from a simple file.

    Formats (line-oriented):
      name:token
      token  (name defaults to token prefix)
    JSON object {"name": "token", ...} also accepted when file starts with '{'.
    """
    text = path.read_text(encoding="utf-8").strip()
    if not text:
        return {}
    if text.startswith("{"):
        import json

        raw = json.loads(text)
        if not isinstance(raw, dict):
            raise ValueError("users file JSON must be an object")
        out: dict[str, str] = {}
        for k, v in raw.items():
            if not isinstance(k, str) or not isinstance(v, str):
                continue
            # Convention: {"alice": "secret-token"} → token maps to alice
            out[v] = k
        return out
    out = {}
    for line in text.splitlines():
        line = line.strip()
        if not line or line.startswith("#"):
            continue
        if ":" in line:
            name, token = line.split(":", 1)
            name, token = name.strip(), token.strip()
            if name and token:
                out[token] = name
        else:
            out[line] = line[:12]
    return out


def token_directory() -> dict[str, str]:
    """Return mapping of bearer token → principal name.

    Sources:
      1. FWBWEB_API_USERS_FILE
      2. FWBWEB_API_USERS  (comma list name:token)
      3. FWBWEB_API_TOKEN  (legacy single token → FWBWEB_API_USER)
    """
    directory: dict[str, str] = {}

    users_file = (settings.api_users_file or "").strip()
    if users_file:
        path = Path(users_file).expanduser()
        if path.is_file():
            directory.update(_load_users_file(path))

    users_env = (settings.api_users or "").strip()
    if users_env:
        for part in users_env.split(","):
            part = part.strip()
            if not part:
                continue
            if ":" not in part:
                continue
            name, token = part.split(":", 1)
            name, token = name.strip(), token.strip()
            if name and token and token not in directory:
                directory[token] = name

    legacy = (settings.api_token or "").strip()
    if legacy and legacy not in directory:
        directory[legacy] = (settings.api_user or "admin").strip() or "admin"

    return directory


def resolve_principal(token: str | None) -> Principal | None:
    if not token:
        return None
    name = token_directory().get(token)
    if name is not None:
        return Principal(token=token, name=name, method="token")

    # Optional OIDC JWT
    from .oidc import looks_like_jwt, oidc_enabled, principal_name_from_claims, validate_oidc_token

    if oidc_enabled() and looks_like_jwt(token):
        try:
            claims = validate_oidc_token(token)
        except Exception:
            return None
        return Principal(
            token=token,
            name=principal_name_from_claims(claims),
            method="oidc",
        )
    return None


async def require_token(
    creds: HTTPAuthorizationCredentials | None = Depends(_bearer),
) -> str:
    """Back-compat: returns the raw bearer token string."""
    principal = await require_principal(creds)
    return principal.token


async def require_principal(
    creds: HTTPAuthorizationCredentials | None = Depends(_bearer),
) -> Principal:
    if creds is None or creds.scheme.lower() != "bearer":
        raise HTTPException(
            status_code=status.HTTP_401_UNAUTHORIZED,
            detail="Bearer token required",
        )
    principal = resolve_principal(creds.credentials)
    if principal is None:
        raise HTTPException(
            status_code=status.HTTP_403_FORBIDDEN,
            detail="Invalid API token",
        )
    return principal
