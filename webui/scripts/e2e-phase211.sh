#!/usr/bin/env bash
# Phase-211: POST expect-install-plan/run returns 501 refusal.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
API_DIR="$ROOT/webui/backend"
source "$API_DIR/.venv/bin/activate"
export FWBWEB_API_TOKEN=dev-token
export FWBWEB_BRIDGE="$ROOT/webui/bin/fwbweb"
export FWBWEB_WORKSPACE="$ROOT/webui/.workspace"
export FWBUILDER_RES_DIR="$ROOT/webui/.res"
PYTHONPATH="$API_DIR${PYTHONPATH:+:$PYTHONPATH}" python3 - <<'PY'
from fastapi.testclient import TestClient
from fwbweb_api.main import app
client = TestClient(app)
r = client.post(
    "/api/v1/expect-install-plan/run?host_os=pix_os",
    headers={"Authorization": "Bearer dev-token"},
)
assert r.status_code == 501, (r.status_code, r.text)
detail = r.json().get("detail") or {}
assert detail.get("error") == "expect_installer_not_implemented"
assert detail.get("implemented") is False
print("expect run refuse 501 ok")
print("cleaned")
PY
grep -q 'expect-install-plan/run' webui/backend/fwbweb_api/routes/platforms.py
echo "OK: phase211 e2e passed"
