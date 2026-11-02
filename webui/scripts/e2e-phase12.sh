#!/usr/bin/env bash
# Phase-12: duplicate_rule.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"

BRIDGE="$ROOT/webui/bin/fwbweb"
API_DIR="$ROOT/webui/backend"
FIX="$ROOT/webui/fixtures/sample-v24.fwb"
TOKEN="${FWBWEB_API_TOKEN:-dev-token}"
PORT="${FWBWEB_PORT:-18100}"
TMP="${TMPDIR:-/tmp}/fwbweb-e2e12-$$"
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
FW=id2679X30989

curl -sf "${auth[@]}" \
  "http://127.0.0.1:$PORT/api/v1/projects/$SID/rulesets/$FW?which=policy" >"$TMP/rules.json"
COUNT_BEFORE=$(python3 -c 'import json; print(len(json.load(open("'"$TMP"'/rules.json"))["rules"]))')
RID=$(python3 -c 'import json; print(json.load(open("'"$TMP"'/rules.json"))["rules"][0]["id"])')
echo "rule=$RID count=$COUNT_BEFORE"

COPY=$(curl -sf "${auth[@]}" -X POST -d '{}' \
  "http://127.0.0.1:$PORT/api/v1/projects/$SID/rules/$RID/duplicate" \
  | python3 -c 'import sys,json;print(json.load(sys.stdin)["id"])')
echo "copy=$COPY"
test "$COPY" != "$RID"

curl -sf "${auth[@]}" \
  "http://127.0.0.1:$PORT/api/v1/projects/$SID/rulesets/$FW?which=policy" >"$TMP/rules2.json"
python3 - <<PY
import json
d=json.load(open("$TMP/rules2.json"))
ids=[r["id"] for r in d["rules"]]
assert "$COPY" in ids, ids
assert len(d["rules"]) == $COUNT_BEFORE + 1, (len(d["rules"]), $COUNT_BEFORE)
# copy should sit after source
src_pos=next(r["position"] for r in d["rules"] if r["id"]=="$RID")
cpy_pos=next(r["position"] for r in d["rules"] if r["id"]=="$COPY")
print("positions", src_pos, cpy_pos)
assert cpy_pos == src_pos + 1, (src_pos, cpy_pos)
# negate on source rule src element, then restore
import urllib.request
H={"Authorization":"Bearer $TOKEN","Content-Type":"application/json"}
def post(path, body):
    data=json.dumps(body).encode()
    req=urllib.request.Request(
      f"http://127.0.0.1:$PORT/api/v1/projects/$SID"+path,
      data=data, method="POST", headers=H)
    return json.load(urllib.request.urlopen(req))
negged=post(f"/rules/$RID/neg", {"element":"src","neg":True})
assert (negged.get("src") or {}).get("neg") is True, negged
restored=post(f"/rules/$RID/neg", {"element":"src","neg":False})
assert (restored.get("src") or {}).get("neg") is False, restored
print("negate ok")
req=urllib.request.Request(
  f"http://127.0.0.1:$PORT/api/v1/projects/$SID/rules/$COPY",
  method="DELETE", headers={"Authorization":"Bearer $TOKEN"})
urllib.request.urlopen(req).read()
print("cleaned")
PY

curl -sf -o /dev/null -w "%{http_code}\n" "${auth[@]}" -X POST \
  "http://127.0.0.1:$PORT/api/v1/projects/$SID/close" | grep -q 204
echo "OK: phase12 e2e passed"
