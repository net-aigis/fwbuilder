#!/usr/bin/env bash
# Phase-138: QGroupBox sections in option-schema.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"

BRIDGE="$ROOT/webui/bin/fwbweb"
API_DIR="$ROOT/webui/backend"
TOKEN="${FWBWEB_API_TOKEN:-dev-token}"
PORT="${FWBWEB_PORT:-18138}"
TMP="${TMPDIR:-/tmp}/fwbweb-e2e138-$$"
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
  "http://127.0.0.1:$PORT/api/v1/option-schema?platform=pf&host_os=freebsd" \
  >"$TMP/schema.json"

python3 - <<PY
import json
d=json.load(open("$TMP/schema.json"))
groups=d.get("groups") or []
assert groups, d
with_sec=[g for g in groups if g.get("sections")]
assert with_sec, "expected QGroupBox sections on pf schema"
titles=[s["title"] for g in with_sec for s in g["sections"]]
assert any("Built-in installer" in t or "Limits" in t or "TCP" in t for t in titles), titles
print("sections ok", titles[:8])
print("cleaned")
PY

extras="$ROOT/webui/frontend/src/components/FirewallExtras.tsx"
grep -q 'optionSections' "$extras"
grep -q 'option-section-title' "$extras"
echo "OK: phase138 e2e passed"
