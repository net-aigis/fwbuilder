#!/usr/bin/env bash
# Phase-186: raw installer_commands* file preview API.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"

BRIDGE="$ROOT/webui/bin/fwbweb"
API_DIR="$ROOT/webui/backend"
TOKEN="${FWBWEB_API_TOKEN:-dev-token}"
PORT="${FWBWEB_PORT:-18186}"
TMP="${TMPDIR:-/tmp}/fwbweb-e2e186-$$"
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
  "http://127.0.0.1:$PORT/api/v1/installer-configlet-file?host_os=pix_os&name=installer_commands_pre_config" \
  >"$TMP/pre.json"

python3 - <<PY
import json
d=json.load(open("$TMP/pre.json"))
assert d["ok"] is True
assert "installer_commands_pre_config" == d["name"]
assert d.get("text") and len(d["text"]) > 10
print("configlet file preview ok", d["size"])
print("cleaned")
PY

# invalid name rejected
code=$(curl -s -o /dev/null -w '%{http_code}' "${auth[@]}" \
  "http://127.0.0.1:$PORT/api/v1/installer-configlet-file?host_os=pix_os&name=../etc/passwd" || true)
test "$code" = "400" -o "$code" = "422"

grep -q 'read_installer_configlet_file' "$ROOT/webui/backend/fwbweb_api/configlets.py"
echo "OK: phase186 e2e passed"
