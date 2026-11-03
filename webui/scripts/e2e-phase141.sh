#!/usr/bin/env bash
# Phase-141: linux24 root vs reg_user activation configlets differ.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"

BRIDGE="$ROOT/webui/bin/fwbweb"
API_DIR="$ROOT/webui/backend"
TOKEN="${FWBWEB_API_TOKEN:-dev-token}"
PORT="${FWBWEB_PORT:-18141}"
TMP="${TMPDIR:-/tmp}/fwbweb-e2e141-$$"
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
  "http://127.0.0.1:$PORT/api/v1/installer-configlet?host_os=linux24&user=root" \
  >"$TMP/root.json"
curl -sf "${auth[@]}" \
  "http://127.0.0.1:$PORT/api/v1/installer-configlet?host_os=linux24&user=fwadmin" \
  >"$TMP/reg.json"

python3 - <<PY
import json
root=json.load(open("$TMP/root.json"))
reg=json.load(open("$TMP/reg.json"))
rc=root["preview"]["command"]
uc=reg["preview"]["command"]
assert "installer_commands_root" in (root["preview"].get("source") or "")
assert "installer_commands_reg_user" in (reg["preview"].get("source") or "")
assert "sudo" in uc
assert "sudo" not in rc
assert "sh " in rc or "chmod" in rc
assert rc != uc
print("root vs reg ok")
print("cleaned")
PY
echo "OK: phase141 e2e passed"
