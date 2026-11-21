#!/usr/bin/env bash
# Phase-194: GET /ssh-auth capabilities.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"

BRIDGE="$ROOT/webui/bin/fwbweb"
API_DIR="$ROOT/webui/backend"
TOKEN="${FWBWEB_API_TOKEN:-dev-token}"
PORT="${FWBWEB_PORT:-18194}"
TMP="${TMPDIR:-/tmp}/fwbweb-e2e194-$$"
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
auth=(-H "Authorization: Bearer $TOKEN")

curl -sf "${auth[@]}" "http://127.0.0.1:$PORT/api/v1/ssh-auth" >"$TMP/ssh.json"
python3 - <<PY
import json
d=json.load(open("$TMP/ssh.json"))
assert d["batch_mode"] is True
assert d["password_supported"] is False
assert "BatchMode" in d["note"]
print("ssh-auth ok", d["not_implemented"])
print("cleaned")
PY
grep -q 'ssh_auth_capabilities' "$ROOT/webui/backend/fwbweb_api/deploy.py"
grep -q 'fetchSshAuth' "$ROOT/webui/frontend/src/api/client.ts"
echo "OK: phase194 e2e passed"
