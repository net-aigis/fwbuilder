#!/usr/bin/env bash
# Phase-201: expect install plan API (not executable).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"

BRIDGE="$ROOT/webui/bin/fwbweb"
API_DIR="$ROOT/webui/backend"
TOKEN="${FWBWEB_API_TOKEN:-dev-token}"
PORT="${FWBWEB_PORT:-18201}"
TMP="${TMPDIR:-/tmp}/fwbweb-e2e201-$$"
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
  "http://127.0.0.1:$PORT/api/v1/expect-install-plan?host_os=pix_os" \
  >"$TMP/plan.json"

python3 - <<PY
import json
d=json.load(open("$TMP/plan.json"))
assert d["ok"] is True
assert d["executable"] is False
assert d["step_count"] >= 4
ids=[s["id"] for s in d["steps"]]
assert "pre_config" in ids and "post_config" in ids
pre=next(s for s in d["steps"] if s["id"]=="pre_config")
assert "preview" in pre
print("expect plan ok", d["step_count"], ids)
print("cleaned")
PY
echo "OK: phase201 e2e passed"
