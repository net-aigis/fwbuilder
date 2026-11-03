#!/usr/bin/env bash
# Phase-198: deploy refuse allow_password_auth.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'allow_password_auth' webui/backend/fwbweb_api/routes/deploy.py
grep -q 'password_auth_not_implemented' webui/backend/fwbweb_api/routes/deploy.py

BRIDGE="$ROOT/webui/bin/fwbweb"
API_DIR="$ROOT/webui/backend"
TOKEN="${FWBWEB_API_TOKEN:-dev-token}"
PORT="${FWBWEB_PORT:-18198}"
TMP="${TMPDIR:-/tmp}/fwbweb-e2e198-$$"
mkdir -p "$TMP"

export FWBWEB_BRIDGE="$BRIDGE"
export FWBWEB_API_TOKEN="$TOKEN"
export FWBWEB_WORKSPACE="$ROOT/webui/.workspace"
export FWBUILDER_RES_DIR="$ROOT/webui/.res"

source "$API_DIR/.venv/bin/activate"
cd "$API_DIR"
uvicorn fwbweb_api.main:app --host 127.0.0.1 --port "$PORT" >"$TMP/api.log" 2>&1 &
API_PID=$!
cleanup() { kill "$API_PID" 2>/dev/null || true; rm -rf "$TMP"; }
trap cleanup EXIT

for _ in $(seq 1 50); do
  curl -sf "http://127.0.0.1:$PORT/api/v1/health" >/dev/null && break
  sleep 0.2
done

# Open a tiny session then hit deploy with allow_password_auth (should 400 before compile).
# Use a fake session id — should 404 OR if we open session, 400 on password.
# Prefer unit-level: import the route logic via FastAPI TestClient if available.
PYTHONPATH="$API_DIR${PYTHONPATH:+:$PYTHONPATH}" python3 - <<'PY'
from fastapi.testclient import TestClient
from fwbweb_api.main import app
import os
os.environ.setdefault("FWBWEB_API_TOKEN", "dev-token")
client = TestClient(app)
# Without a real session we still hit the password check first... actually session is after password check.
r = client.post(
    "/api/v1/projects/no-such-session/deploy",
    headers={"Authorization": "Bearer dev-token"},
    json={"firewall_id": "x", "allow_password_auth": True, "dry_run": True, "compile_first": False},
)
assert r.status_code == 400, (r.status_code, r.text)
detail = r.json().get("detail") or {}
assert detail.get("error") == "password_auth_not_implemented"
assert detail.get("ssh_auth", {}).get("password_supported") is False
print("password refuse ok")
print("cleaned")
PY
echo "OK: phase198 e2e passed"
