#!/usr/bin/env bash
# Phase-254: soft_fertig_honesty_track on /hard-gaps.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"

BRIDGE="$ROOT/webui/bin/fwbweb"
API_DIR="$ROOT/webui/backend"
TOKEN="${FWBWEB_API_TOKEN:-dev-token}"
PORT="${FWBWEB_PORT:-18254}"
TMP="${TMPDIR:-/tmp}/fwbweb-e2e254-$$"
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

curl -sf "${auth[@]}" "http://127.0.0.1:$PORT/api/v1/hard-gaps" >"$TMP/gaps.json"
python3 - <<PY
import json
d=json.load(open("$TMP/gaps.json"))
assert d.get("soft_fertig_honesty_track") is True
assert "soft-complete" in (d.get("note") or "").lower() or "soft_fertig" in (d.get("note") or "")
print("soft_fertig flag ok", d["soft_complete_phase"])
print("cleaned")
PY
echo "OK: phase254 e2e passed"
