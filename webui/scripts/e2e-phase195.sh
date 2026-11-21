#!/usr/bin/env bash
# Phase-195: expanded installer configlet file preview.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"

BRIDGE="$ROOT/webui/bin/fwbweb"
API_DIR="$ROOT/webui/backend"
TOKEN="${FWBWEB_API_TOKEN:-dev-token}"
PORT="${FWBWEB_PORT:-18195}"
TMP="${TMPDIR:-/tmp}/fwbweb-e2e195-$$"
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
  "http://127.0.0.1:$PORT/api/v1/installer-configlet-file?host_os=pix_os&name=installer_commands_pre_config&expand=true" \
  >"$TMP/exp.json"

python3 - <<PY
import json
d=json.load(open("$TMP/exp.json"))
assert d["ok"] is True
assert d["expanded"] is True
assert d.get("expanded_text") and "[if schedule_rollback]" in d["expanded_text"]
print("expanded configlet ok", len(d["expanded_text"]))
print("cleaned")
PY
echo "OK: phase195 e2e passed"
