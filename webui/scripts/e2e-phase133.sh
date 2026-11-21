#!/usr/bin/env bash
# Phase-133: GET /api/v1/installer-configlet Preview.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"

BRIDGE="$ROOT/webui/bin/fwbweb"
API_DIR="$ROOT/webui/backend"
TOKEN="${FWBWEB_API_TOKEN:-dev-token}"
PORT="${FWBWEB_PORT:-18133}"
TMP="${TMPDIR:-/tmp}/fwbweb-e2e133-$$"
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
  "http://127.0.0.1:$PORT/api/v1/installer-configlet?host_os=linux24&user=fwadmin&fwdir=/etc/init.d&fwscript=firewall.fw" \
  >"$TMP/cfg.json"
python3 - <<PY
import json
d=json.load(open("$TMP/cfg.json"))
print(d.get("family"), d.get("configlet_dir"))
prev=d.get("preview") or {}
assert prev.get("ok") is True
assert "sudo" in prev.get("command","")
assert "firewall.fw" in prev.get("command","")
assert "installer_commands_reg_user" in str(prev.get("source"))
print("preview ok")
print("cleaned")
PY
echo "OK: phase133 e2e passed"
