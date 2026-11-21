#!/usr/bin/env bash
# Phase-2 local E2E: search + policy ruleset + disable/enable a rule.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"

BRIDGE="$ROOT/webui/bin/fwbweb"
API_DIR="$ROOT/webui/backend"
FIX="$ROOT/webui/fixtures/sample-v24.fwb"
TOKEN="${FWBWEB_API_TOKEN:-dev-token}"
PORT="${FWBWEB_PORT:-18089}"
TMP="${TMPDIR:-/tmp}/fwbweb-e2e2-$$"
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
auth=(-H "Authorization: Bearer $TOKEN" -H "Content-Type: application/json")

curl -sf "${auth[@]}" -d "{\"path\":\"$FIX\",\"copy_to_workspace\":true}" \
  "http://127.0.0.1:$PORT/api/v1/projects/open" >"$TMP/open.json"
SID=$(python3 -c 'import json; print(json.load(open("'"$TMP"'/open.json"))["session_id"])')

echo "== search Firewall =="
curl -sf "${auth[@]}" \
  "http://127.0.0.1:$PORT/api/v1/projects/$SID/search?q=nft-test&type=Firewall" \
  >"$TMP/search.json"
python3 -m json.tool <"$TMP/search.json" | head -40
FW=$(python3 - <<PY
import json
d=json.load(open("$TMP/search.json"))
assert d["count"]>=1, d
print(d["results"][0]["id"])
PY
)

echo "== policy ruleset =="
curl -sf "${auth[@]}" \
  "http://127.0.0.1:$PORT/api/v1/projects/$SID/rulesets/$FW?which=policy" \
  >"$TMP/rules.json"
python3 - <<PY
import json
d=json.load(open("$TMP/rules.json"))
rules=d["rules"]
print("ruleset", d["name"], "count", len(rules))
assert len(rules)>=1, d
print("first", rules[0]["position"], rules[0]["action"], rules[0]["id"])
open("$TMP/rule0.json","w").write(json.dumps(rules[0]))
PY
RID=$(python3 -c 'import json; print(json.load(open("'"$TMP"'/rule0.json"))["id"])')
DISABLED=$(python3 -c 'import json; print(json.load(open("'"$TMP"'/rule0.json"))["disabled"])')

echo "== toggle disable =="
NEW=$(python3 - <<PY
print("true" if "$DISABLED"=="False" else "false")
PY
)
# Python True/False from json
NEW=$(python3 -c 'import json; print("true" if not json.load(open("'"$TMP"'/rule0.json"))["disabled"] else "false")')
curl -sf "${auth[@]}" -X PATCH -d "{\"disabled\": $NEW}" \
  "http://127.0.0.1:$PORT/api/v1/projects/$SID/rules/$RID" >"$TMP/upd.json"
python3 - <<PY
import json
r=json.load(open("$TMP/upd.json"))
print("disabled now", r["disabled"])
assert r["disabled"] is True or r["disabled"] is False
PY

curl -sf "${auth[@]}" -d '{}' "http://127.0.0.1:$PORT/api/v1/projects/$SID/save" >/dev/null
curl -sf -o /dev/null -w "%{http_code}\n" "${auth[@]}" -X POST \
  "http://127.0.0.1:$PORT/api/v1/projects/$SID/close" | grep -q 204

echo "OK: phase2 e2e passed"
