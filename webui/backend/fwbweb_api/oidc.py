"""Optional OIDC / OAuth2 JWT bearer validation (JWKS).

Enabled when FWBWEB_OIDC_ISSUER (or FWBWEB_OIDC_JWKS_URL) is set.
Static API tokens remain valid alongside OIDC.
"""

from __future__ import annotations

import time
from typing import Any

import httpx
import jwt
from jwt import PyJWKClient

from .settings import settings

_jwks_client: PyJWKClient | None = None
_jwks_url_cached: str | None = None
_discovery_at: float = 0.0
_discovery_ttl = 3600.0


def oidc_enabled() -> bool:
    return bool((settings.oidc_issuer or "").strip() or (settings.oidc_jwks_url or "").strip())


def oidc_config_public() -> dict[str, Any]:
    return {
        "enabled": oidc_enabled(),
        "issuer": (settings.oidc_issuer or "").strip() or None,
        "audience": (settings.oidc_audience or "").strip() or None,
        "jwks_url": (settings.oidc_jwks_url or "").strip() or None,
        "note": (
            "Send Authorization: Bearer <access_token> from your IdP. "
            "Static FWBWEB_API_TOKEN / FWBWEB_API_USERS still work."
            if oidc_enabled()
            else "Set FWBWEB_OIDC_ISSUER (and optional FWBWEB_OIDC_AUDIENCE) to enable."
        ),
    }


def _resolve_jwks_url() -> str:
    explicit = (settings.oidc_jwks_url or "").strip()
    if explicit:
        return explicit
    issuer = (settings.oidc_issuer or "").strip().rstrip("/")
    if not issuer:
        raise RuntimeError("OIDC issuer/jwks_url not configured")
    global _discovery_at, _jwks_url_cached
    now = time.time()
    if _jwks_url_cached and now - _discovery_at < _discovery_ttl:
        return _jwks_url_cached
    well_known = f"{issuer}/.well-known/openid-configuration"
    with httpx.Client(timeout=10.0) as client:
        resp = client.get(well_known)
        resp.raise_for_status()
        jwks = resp.json().get("jwks_uri")
    if not jwks:
        raise RuntimeError(f"no jwks_uri in {well_known}")
    _jwks_url_cached = str(jwks)
    _discovery_at = now
    return _jwks_url_cached


def _get_jwks_client() -> PyJWKClient:
    global _jwks_client, _jwks_url_cached
    url = _resolve_jwks_url()
    if _jwks_client is None or _jwks_url_cached != url:
        _jwks_client = PyJWKClient(url, cache_keys=True)
        _jwks_url_cached = url
    return _jwks_client


def looks_like_jwt(token: str) -> bool:
    parts = token.split(".")
    return len(parts) == 3 and all(parts)


def validate_oidc_token(token: str) -> dict[str, Any]:
    """Validate JWT and return claims. Raises jwt.PyJWTError / RuntimeError on failure."""
    if not oidc_enabled():
        raise RuntimeError("OIDC not enabled")
    signing_key = _get_jwks_client().get_signing_key_from_jwt(token)
    options = {"require": ["exp", "sub"]}
    decode_kwargs: dict[str, Any] = {
        "algorithms": ["RS256", "ES256", "PS256"],
        "options": options,
    }
    issuer = (settings.oidc_issuer or "").strip()
    if issuer:
        decode_kwargs["issuer"] = issuer.rstrip("/")
    audience = (settings.oidc_audience or "").strip()
    if audience:
        decode_kwargs["audience"] = audience
    else:
        # Some IdPs omit aud on access tokens; allow when not configured.
        decode_kwargs["options"] = {**options, "verify_aud": False}
    return jwt.decode(token, signing_key.key, **decode_kwargs)


def principal_name_from_claims(claims: dict[str, Any]) -> str:
    for key in ("preferred_username", "email", "name", "sub"):
        val = claims.get(key)
        if isinstance(val, str) and val.strip():
            return val.strip()
    return "oidc-user"


def reset_oidc_cache() -> None:
    """Test helper."""
    global _jwks_client, _jwks_url_cached, _discovery_at
    _jwks_client = None
    _jwks_url_cached = None
    _discovery_at = 0.0
