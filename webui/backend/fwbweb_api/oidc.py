"""Optional OIDC / OAuth2 JWT bearer validation + auth-code/PKCE helpers.

Enabled when FWBWEB_OIDC_ISSUER (or FWBWEB_OIDC_JWKS_URL) is set.
SPA login needs FWBWEB_OIDC_CLIENT_ID (+ optional secret) and redirect URI.
Static API tokens remain valid alongside OIDC.
"""

from __future__ import annotations

import time
from typing import Any
from urllib.parse import urlencode

import httpx
import jwt
from jwt import PyJWKClient

from .settings import settings

_jwks_client: PyJWKClient | None = None
_jwks_url_cached: str | None = None
_discovery: dict[str, Any] | None = None
_discovery_at: float = 0.0
_discovery_ttl = 3600.0


def oidc_enabled() -> bool:
    return bool((settings.oidc_issuer or "").strip() or (settings.oidc_jwks_url or "").strip())


def oidc_login_enabled() -> bool:
    return oidc_enabled() and bool((settings.oidc_client_id or "").strip())


def _issuer() -> str:
    return (settings.oidc_issuer or "").strip().rstrip("/")


def discover() -> dict[str, Any]:
    """OIDC discovery document (cached)."""
    global _discovery, _discovery_at
    now = time.time()
    if _discovery and now - _discovery_at < _discovery_ttl:
        return _discovery
    issuer = _issuer()
    if not issuer:
        raise RuntimeError("OIDC issuer not configured")
    well_known = f"{issuer}/.well-known/openid-configuration"
    with httpx.Client(timeout=10.0) as client:
        resp = client.get(well_known)
        resp.raise_for_status()
        data = resp.json()
    if not isinstance(data, dict):
        raise RuntimeError("invalid OIDC discovery document")
    _discovery = data
    _discovery_at = now
    return data


def oidc_config_public() -> dict[str, Any]:
    cfg: dict[str, Any] = {
        "enabled": oidc_enabled(),
        "login_enabled": oidc_login_enabled(),
        "issuer": _issuer() or None,
        "audience": (settings.oidc_audience or "").strip() or None,
        "jwks_url": (settings.oidc_jwks_url or "").strip() or None,
        "client_id": (settings.oidc_client_id or "").strip() or None,
        "redirect_uri": (settings.oidc_redirect_uri or "").strip() or None,
        "scopes": (settings.oidc_scopes or "openid profile email").strip(),
        "authorization_endpoint": None,
        "note": (
            "SPA: Login with IdP (PKCE) or paste a bearer JWT. "
            "Static FWBWEB_API_TOKEN / FWBWEB_API_USERS still work."
            if oidc_enabled()
            else "Set FWBWEB_OIDC_ISSUER (and FWBWEB_OIDC_CLIENT_ID for SPA login)."
        ),
    }
    if oidc_enabled() and _issuer():
        try:
            disc = discover()
            cfg["authorization_endpoint"] = disc.get("authorization_endpoint")
            cfg["jwks_url"] = cfg["jwks_url"] or disc.get("jwks_uri")
        except Exception as exc:  # noqa: BLE001 — surface soft failure to clients
            cfg["discovery_error"] = str(exc)
    return cfg


def build_authorize_url(*, state: str, code_challenge: str, redirect_uri: str | None = None) -> str:
    if not oidc_login_enabled():
        raise RuntimeError("OIDC SPA login not configured (need issuer + client_id)")
    disc = discover()
    auth_ep = disc.get("authorization_endpoint")
    if not auth_ep:
        raise RuntimeError("discovery missing authorization_endpoint")
    redir = (redirect_uri or settings.oidc_redirect_uri or "").strip()
    if not redir:
        raise RuntimeError("redirect_uri required (FWBWEB_OIDC_REDIRECT_URI)")
    params = {
        "response_type": "code",
        "client_id": (settings.oidc_client_id or "").strip(),
        "redirect_uri": redir,
        "scope": (settings.oidc_scopes or "openid profile email").strip(),
        "state": state,
        "code_challenge": code_challenge,
        "code_challenge_method": "S256",
    }
    aud = (settings.oidc_audience or "").strip()
    if aud:
        params["audience"] = aud  # Auth0-style; ignored by many IdPs
    return f"{auth_ep}?{urlencode(params)}"


def exchange_code(
    *,
    code: str,
    code_verifier: str,
    redirect_uri: str | None = None,
) -> dict[str, Any]:
    """Exchange authorization code for tokens (confidential or public+PKCE)."""
    if not oidc_login_enabled():
        raise RuntimeError("OIDC SPA login not configured")
    disc = discover()
    token_ep = disc.get("token_endpoint")
    if not token_ep:
        raise RuntimeError("discovery missing token_endpoint")
    redir = (redirect_uri or settings.oidc_redirect_uri or "").strip()
    data = {
        "grant_type": "authorization_code",
        "code": code,
        "redirect_uri": redir,
        "client_id": (settings.oidc_client_id or "").strip(),
        "code_verifier": code_verifier,
    }
    secret = (settings.oidc_client_secret or "").strip()
    auth = (data["client_id"], secret) if secret else None
    with httpx.Client(timeout=20.0) as client:
        resp = client.post(token_ep, data=data, auth=auth)
        if resp.status_code >= 400:
            raise RuntimeError(f"token endpoint {resp.status_code}: {resp.text[:500]}")
        return resp.json()


def _resolve_jwks_url() -> str:
    explicit = (settings.oidc_jwks_url or "").strip()
    if explicit:
        return explicit
    disc = discover()
    jwks = disc.get("jwks_uri")
    if not jwks:
        raise RuntimeError("no jwks_uri in discovery")
    return str(jwks)


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
    issuer = _issuer()
    if issuer:
        decode_kwargs["issuer"] = issuer
    audience = (settings.oidc_audience or "").strip()
    if audience:
        decode_kwargs["audience"] = audience
    else:
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
    global _jwks_client, _jwks_url_cached, _discovery, _discovery_at
    _jwks_client = None
    _jwks_url_cached = None
    _discovery = None
    _discovery_at = 0.0
