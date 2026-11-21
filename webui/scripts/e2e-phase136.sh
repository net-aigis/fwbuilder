#!/usr/bin/env bash
# Phase-136: GET /installer-configlets list + interactive flag.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"

BRIDGE="$ROOT/webui/bin/fwbweb"
API_DIR="$ROOT/webui/backend"
TOKEN="${FWBWEB_API_TOKEN:-dev-token}"
PORT="${FWBWEB_PORT:-18136}"
TMP="${TMPDIR:-/tmp}/fwbweb-e2e136-$$"
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
  "http://127.0.0.1:$PORT/api/v1/installer-configlets?host_os=linux24" \
  >"$TMP/linux.json"
curl -sf "${auth[@]}" \
  "http://127.0.0.1:$PORT/api/v1/installer-configlets?host_os=ios" \
  >"$TMP/ios.json"

python3 - <<PY
import json
linux=json.load(open("$TMP/linux.json"))
ios=json.load(open("$TMP/ios.json"))
assert "installer_commands_reg_user" in linux.get("names", [])
assert "installer_commands_root" in linux.get("names", [])
assert linux.get("interactive_installer") is False
assert "installer_commands_pre_config" in ios.get("names", [])
assert ios.get("interactive_installer") is True
assert ios.get("note")
print("list ok", linux["names"], ios["names"])
print("cleaned")
PY
echo "OK: phase136 e2e passed"
