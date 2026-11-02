from pathlib import Path

from pydantic_settings import BaseSettings, SettingsConfigDict


class Settings(BaseSettings):
    model_config = SettingsConfigDict(env_prefix="FWBWEB_", env_file=".env", extra="ignore")

    api_token: str = "dev-token"
    bridge: Path = Path("fwbweb")
    workspace: Path = Path("./.workspace")
    bridge_timeout_sec: float = 120.0
    cors_origins: str = "http://127.0.0.1:5173,http://localhost:5173"

    @property
    def cors_origin_list(self) -> list[str]:
        return [o.strip() for o in self.cors_origins.split(",") if o.strip()]


settings = Settings()
