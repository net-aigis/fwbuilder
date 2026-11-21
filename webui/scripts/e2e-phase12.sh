#!/usr/bin/env bash
# Phase-12: duplicate_rule + negate + rule meta (group/comment).
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

python3 - <<PY
import json, urllib.request
H={"Authorization":"Bearer $TOKEN","Content-Type":"application/json"}
base=f"http://127.0.0.1:$PORT/api/v1/projects/$SID"

def get(path):
    return json.load(urllib.request.urlopen(urllib.request.Request(base+path, headers=H)))

def post(path, body=None):
    data=b"{}" if body is None else json.dumps(body).encode()
    req=urllib.request.Request(base+path, data=data, method="POST", headers=H)
    return json.load(urllib.request.urlopen(req))

def patch(path, body):
    data=json.dumps(body).encode()
    req=urllib.request.Request(base+path, data=data, method="PATCH", headers=H)
    return json.load(urllib.request.urlopen(req))

def delete(path):
    req=urllib.request.Request(base+path, method="DELETE", headers=H)
    return json.load(urllib.request.urlopen(req))

rules=get(f"/rulesets/$FW?which=policy")["rules"]
count_before=len(rules)
rid=rules[0]["id"]
print("rule", rid, "count", count_before)

copy=post(f"/rules/{rid}/duplicate")
cid=copy["id"]
assert cid != rid, copy
print("copy", cid)

rules2=get(f"/rulesets/$FW?which=policy")["rules"]
ids=[r["id"] for r in rules2]
assert cid in ids, ids
assert len(rules2)==count_before+1, (len(rules2), count_before)
src_pos=next(r["position"] for r in rules2 if r["id"]==rid)
cpy_pos=next(r["position"] for r in rules2 if r["id"]==cid)
print("positions", src_pos, cpy_pos)
assert cpy_pos == src_pos + 1, (src_pos, cpy_pos)

negged=post(f"/rules/{rid}/neg", {"element":"src","neg":True})
assert (negged.get("src") or {}).get("neg") is True, negged
restored=post(f"/rules/{rid}/neg", {"element":"src","neg":False})
assert (restored.get("src") or {}).get("neg") is False, restored
print("negate ok")

meta=patch(f"/rules/{rid}", {"group":"webui-e2e-group","comment":"e2e meta"})
assert meta.get("group")=="webui-e2e-group", meta
assert meta.get("comment")=="e2e meta", meta
print("meta ok")
patch(f"/rules/{rid}", {"group":"","comment":""})

delete(f"/rules/{cid}")
print("cleaned")
PY

curl -sf -o /dev/null -w "%{http_code}\n" "${auth[@]}" -X POST \
  "http://127.0.0.1:$PORT/api/v1/projects/$SID/close" | grep -q 204
echo "OK: phase12 e2e passed"
