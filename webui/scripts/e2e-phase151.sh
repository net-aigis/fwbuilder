#!/usr/bin/env bash
# Phase-151: .ui tooltips in option-schema / OptionField.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"

BRIDGE="$ROOT/webui/bin/fwbweb"
API_DIR="$ROOT/webui/backend"
TOKEN="${FWBWEB_API_TOKEN:-dev-token}"
PORT="${FWBWEB_PORT:-18151}"
TMP="${TMPDIR:-/tmp}/fwbweb-e2e151-$$"
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
  "http://127.0.0.1:$PORT/api/v1/rule-option-schema?rule_kind=policy" \
  >"$TMP/schema.json"

python3 - <<PY
import json
d=json.load(open("$TMP/schema.json"))
fields=d.get("fields") or {}
tipped=[(k,v.get("tooltip")) for k,v in fields.items() if v.get("tooltip")]
assert tipped, "expected tooltips from .ui"
print("tooltips ok", tipped[0][0], tipped[0][1][:50])
print("cleaned")
PY
opt="$ROOT/webui/frontend/src/components/OptionField.tsx"
grep -q 'tooltip' "$opt"
grep -q 'meta?.tooltip' "$opt"
echo "OK: phase151 e2e passed"
