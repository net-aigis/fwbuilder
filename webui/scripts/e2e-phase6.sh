#!/usr/bin/env bash
# Phase-6: typed dialog fields + PolicyRuleOptions via options API.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"

BRIDGE="$ROOT/webui/bin/fwbweb"
API_DIR="$ROOT/webui/backend"
FIX="$ROOT/webui/fixtures/sample-v24.fwb"
TOKEN="${FWBWEB_API_TOKEN:-dev-token}"
PORT="${FWBWEB_PORT:-18094}"
TMP="${TMPDIR:-/tmp}/fwbweb-e2e6-$$"
mkdir -p "$TMP"

export FWBWEB_BRIDGE="$BRIDGE"
export FWBWEB_API_TOKEN="$TOKEN"
export FWBWEB_WORKSPACE="$ROOT/webui/.workspace"
export FWBUILDER_RES_DIR="$ROOT/webui/.res"

[[ -d "$ROOT/webui/.res/platform" ]] || {
  mkdir -p "$ROOT/webui/.res"
  cp -a "$ROOT/src/res/platform" "$ROOT/src/res/os" "$ROOT/webui/.res/"
}

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
auth=(-H "Authorization: Bearer $TOKEN" -H "Content-Type: application/json")

curl -sf "${auth[@]}" -d "{\"path\":\"$FIX\",\"copy_to_workspace\":true}" \
  "http://127.0.0.1:$PORT/api/v1/projects/open" >"$TMP/open.json"
SID=$(python3 -c 'import json; print(json.load(open("'"$TMP"'/open.json"))["session_id"])')
FW=id2679X30989

echo "== policy rule id =="
curl -sf "${auth[@]}" \
  "http://127.0.0.1:$PORT/api/v1/projects/$SID/rulesets/$FW?which=policy" >"$TMP/rules.json"
RID=$(python3 -c 'import json; print(json.load(open("'"$TMP"'/rules.json"))["rules"][0]["id"])')
echo "rule=$RID"

echo "== rule options =="
curl -sf "${auth[@]}" \
  "http://127.0.0.1:$PORT/api/v1/projects/$SID/objects/$RID/options" >"$TMP/ropts.json"
python3 - <<PY
import json
d=json.load(open("$TMP/ropts.json"))
opts=d.get("options") or {}
print("rule option keys", len(opts), sorted(opts)[:12])
# PolicyRuleOptions may be empty on simple Deny rules; still must succeed
assert d.get("ok") is True or "options" in d
PY

echo "== patch a firewall bool via options =="
curl -sf "${auth[@]}" -X PATCH \
  -d '{"options":{"check_shading":"False","log_all":"True"}}' \
  "http://127.0.0.1:$PORT/api/v1/projects/$SID/objects/$FW/options" >"$TMP/fwopts.json"
python3 - <<PY
import json
o=json.load(open("$TMP/fwopts.json"))["options"]
assert o.get("check_shading") in ("False","false"), o.get("check_shading")
assert o.get("log_all") in ("True","true"), o.get("log_all")
print("bool patch ok")
PY

curl -sf -o /dev/null -w "%{http_code}\n" "${auth[@]}" -X POST \
  "http://127.0.0.1:$PORT/api/v1/projects/$SID/close" | grep -q 204
echo "OK: phase6 e2e passed"
