#!/usr/bin/env bash
# Phase-165: QGridLayout row/column on option fields.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"

BRIDGE="$ROOT/webui/bin/fwbweb"
API_DIR="$ROOT/webui/backend"
TOKEN="${FWBWEB_API_TOKEN:-dev-token}"
PORT="${FWBWEB_PORT:-18165}"
TMP="${TMPDIR:-/tmp}/fwbweb-e2e165-$$"
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
  "http://127.0.0.1:$PORT/api/v1/option-schema?platform=iptables&host_os=linux24" \
  >"$TMP/schema.json"

python3 - <<PY
import json
d=json.load(open("$TMP/schema.json"))
fields=d.get("fields") or {}
gridded=[(k,v["grid"]) for k,v in fields.items() if v.get("grid")]
assert len(gridded) >= 10, len(gridded)
row,col=gridded[0][1].get("row"), gridded[0][1].get("column")
assert isinstance(row, int) and isinstance(col, int)
print("grid meta ok", gridded[0][0], gridded[0][1])
print("cleaned")
PY
opt="$ROOT/webui/frontend/src/components/OptionField.tsx"
extras="$ROOT/webui/frontend/src/components/FirewallExtras.tsx"
helper="$ROOT/webui/frontend/src/qtGrid.ts"
grep -q 'gridStyle' "$opt"
# qt-grid class lives on the shared helper since phase175 (still used by FirewallExtras).
grep -q 'qt-grid' "$helper"
grep -q 'qtGridStyle\|qt-grid' "$extras"
echo "OK: phase165 e2e passed"
