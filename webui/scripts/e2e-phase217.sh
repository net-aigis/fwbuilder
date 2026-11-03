#!/usr/bin/env bash
# Phase-217: health/res-status soft_complete_phase marker.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"

BRIDGE="$ROOT/webui/bin/fwbweb"
API_DIR="$ROOT/webui/backend"
TOKEN="${FWBWEB_API_TOKEN:-dev-token}"
PORT="${FWBWEB_PORT:-18217}"
TMP="${TMPDIR:-/tmp}/fwbweb-e2e217-$$"
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

curl -sf "http://127.0.0.1:$PORT/api/v1/health" >"$TMP/health.json"
curl -sf "${auth[@]}" "http://127.0.0.1:$PORT/api/v1/res-status" >"$TMP/res.json"
python3 - <<PY
import json
h=json.load(open("$TMP/health.json"))
r=json.load(open("$TMP/res.json"))
assert h.get("soft_complete_phase") == "220"
assert r.get("soft_complete_phase") == "220"
assert "expect_sshsession_runtime" in (r.get("hard_gap_open") or [])
print("soft_complete marker ok", h["soft_complete_phase"])
print("cleaned")
PY
echo "OK: phase217 e2e passed"
