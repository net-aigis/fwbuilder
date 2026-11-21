#!/usr/bin/env bash
# Phase-197: installer-capabilities includes ssh_auth.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"

BRIDGE="$ROOT/webui/bin/fwbweb"
API_DIR="$ROOT/webui/backend"
TOKEN="${FWBWEB_API_TOKEN:-dev-token}"
PORT="${FWBWEB_PORT:-18197}"
TMP="${TMPDIR:-/tmp}/fwbweb-e2e197-$$"
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

curl -sf "${auth[@]}" \
  "http://127.0.0.1:$PORT/api/v1/installer-capabilities?host_os=linux24" \
  >"$TMP/caps.json"

python3 - <<PY
import json
d=json.load(open("$TMP/caps.json"))
assert "ssh_auth" in d
assert d["ssh_auth"]["password_supported"] is False
assert d["ssh_auth"]["batch_mode"] is True
print("capabilities ssh_auth ok")
print("cleaned")
PY
grep -q 'ssh_auth' "$ROOT/webui/backend/fwbweb_api/routes/platforms.py"
echo "OK: phase197 e2e passed"
