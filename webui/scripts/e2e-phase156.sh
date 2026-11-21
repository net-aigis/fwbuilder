#!/usr/bin/env bash
# Phase-156: GET /installer-capabilities + UI recommended mode.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"

BRIDGE="$ROOT/webui/bin/fwbweb"
API_DIR="$ROOT/webui/backend"
TOKEN="${FWBWEB_API_TOKEN:-dev-token}"
PORT="${FWBWEB_PORT:-18156}"
TMP="${TMPDIR:-/tmp}/fwbweb-e2e156-$$"
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
  >"$TMP/linux.json"
curl -sf "${auth[@]}" \
  "http://127.0.0.1:$PORT/api/v1/installer-capabilities?host_os=ios" \
  >"$TMP/ios.json"

python3 - <<PY
import json
linux=json.load(open("$TMP/linux.json"))
ios=json.load(open("$TMP/ios.json"))
assert linux["recommended_webui_mode"] == "scp_ssh", linux
assert linux["webui_modes"]["expect_sshsession"] is False
assert ios["recommended_webui_mode"] == "scp_ssh_limited", ios
assert ios["interactive_installer"] is True
print("capabilities ok", linux["recommended_webui_mode"], ios["recommended_webui_mode"])
print("cleaned")
PY
extras="$ROOT/webui/frontend/src/components/FirewallExtras.tsx"
grep -q 'fetchInstallerCapabilities' "$extras"
grep -q 'Recommended WebUI installer mode' "$extras"
echo "OK: phase156 e2e passed"
