from pathlib import Path

from pydantic_settings import BaseSettings, SettingsConfigDict


class Settings(BaseSettings):
    model_config = SettingsConfigDict(env_prefix="FWBWEB_", env_file=".env", extra="ignore")

    # Legacy single token (maps to api_user). Prefer api_users / api_users_file for multi-user.
    api_token: str = "dev-token"
    api_user: str = "admin"
    # Comma list: "alice:tok-a,bob:tok-b"
    api_users: str = ""
    # Path to name:token lines or JSON {"name": "token", ...}
    api_users_file: str = ""
    # Optional OIDC (JWT via JWKS). Empty issuer+jwks_url = disabled.
    oidc_issuer: str = ""
    oidc_audience: str = ""
    oidc_jwks_url: str = ""
    oidc_client_id: str = ""
    oidc_client_secret: str = ""
    oidc_redirect_uri: str = "http://127.0.0.1:5173/"
    oidc_scopes: str = "openid profile email"
    bridge: Path = Path("../bin/fwbweb")
    workspace: Path = Path("../.workspace")
    bridge_timeout_sec: float = 120.0
    cors_origins: str = "http://127.0.0.1:5173,http://localhost:5173"
    res_dir: Path | None = None
    compiler_dir: Path | None = None

    @property
    def cors_origin_list(self) -> list[str]:
        return [o.strip() for o in self.cors_origins.split(",") if o.strip()]


settings = Settings()
