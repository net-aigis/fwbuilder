#!/usr/bin/env bash
# Phase-167: expect-installer stub API.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"

BRIDGE="$ROOT/webui/bin/fwbweb"
API_DIR="$ROOT/webui/backend"
TOKEN="${FWBWEB_API_TOKEN:-dev-token}"
PORT="${FWBWEB_PORT:-18167}"
TMP="${TMPDIR:-/tmp}/fwbweb-e2e167-$$"
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
  "http://127.0.0.1:$PORT/api/v1/expect-installer?host_os=ios" \
  >"$TMP/ios.json"
curl -sf "${auth[@]}" \
  "http://127.0.0.1:$PORT/api/v1/expect-installer?host_os=linux24" \
  >"$TMP/linux.json"
curl -sf "${auth[@]}" \
  "http://127.0.0.1:$PORT/api/v1/installer-capabilities?host_os=ios" \
  >"$TMP/caps.json"

python3 - <<PY
import json
ios=json.load(open("$TMP/ios.json"))
linux=json.load(open("$TMP/linux.json"))
caps=json.load(open("$TMP/caps.json"))
assert ios["implemented"] is False
assert ios["needed"] is True
assert ios["desktop_steps"]
assert linux["needed"] is False
assert caps.get("expect_installer",{}).get("implemented") is False
print("expect stub ok")
print("cleaned")
PY
echo "OK: phase167 e2e passed"
