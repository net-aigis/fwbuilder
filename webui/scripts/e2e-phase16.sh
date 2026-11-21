#!/usr/bin/env bash
# Phase-16: AddressTable/Tag/User/Custom services + when cell + NAT action + metric.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"

BRIDGE="$ROOT/webui/bin/fwbweb"
API_DIR="$ROOT/webui/backend"
FIX="$ROOT/webui/fixtures/sample-v24.fwb"
TOKEN="${FWBWEB_API_TOKEN:-dev-token}"
PORT="${FWBWEB_PORT:-18106}"
TMP="${TMPDIR:-/tmp}/fwbweb-e2e16-$$"
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

nets=[r for r in get("/search?q=Networks&type=ObjectGroup&limit=20")["results"]
      if r["name"]=="Networks" and not str(r["id"]).startswith("std")][0]["id"]
svcs=[r for r in get("/search?q=Services&type=ServiceGroup&limit=20")["results"]
      if r["name"]=="Services" and not str(r["id"]).startswith("std")][0]["id"]
times=[r for r in get("/search?q=Time&type=IntervalGroup&limit=20")["results"]
       if r["name"]=="Time" and not str(r["id"]).startswith("std")][0]["id"]

at=post("/objects", {
  "parent_id": nets,
  "type": "AddressTable",
  "name": "webui-e2e-at",
  "attrs": {"filename": "/tmp/webui-e2e-addrs.txt", "run_time": "True"},
})
aattrs=at.get("attrs") or {}
print("AddressTable", aattrs)
assert aattrs.get("filename")=="/tmp/webui-e2e-addrs.txt", aattrs
assert str(aattrs.get("run_time")).lower() in ("true","1"), aattrs

tag=post("/objects", {
  "parent_id": svcs,
  "type": "TagService",
  "name": "webui-e2e-tag",
  "attrs": {"tagcode": "webui-tag-42"},
})
assert (tag.get("attrs") or {}).get("tagcode")=="webui-tag-42", tag

usr=post("/objects", {
  "parent_id": svcs,
  "type": "UserService",
  "name": "webui-e2e-user",
  "attrs": {"userid": "alice"},
})
assert (usr.get("attrs") or {}).get("userid")=="alice", usr

cust=post("/objects", {
  "parent_id": svcs,
  "type": "CustomService",
  "name": "webui-e2e-custom",
  "attrs": {"protocol": "tcp", "address_family": "inet", "code": "accept"},
})
cattrs=cust.get("attrs") or {}
print("CustomService", cattrs)
assert cattrs.get("protocol")=="tcp", cattrs
assert cattrs.get("address_family")=="inet", cattrs

iv=post("/objects", {
  "parent_id": times,
  "type": "Interval",
  "name": "webui-e2e-when",
  "attrs": {"from_hour": 8, "to_hour": 18, "days_of_week": "1,2,3,4,5"},
})

rules=get(f"/rulesets/$FW?which=policy")["rules"]
rid=rules[0]["id"]
added=post(f"/rules/{rid}/refs", {"element": "when", "object_id": iv["id"]})
when_objs=((added.get("when") or {}).get("objects") or [])
print("when", [o["id"] for o in when_objs])
assert iv["id"] in [o["id"] for o in when_objs], when_objs
post(f"/rules/{rid}/refs/remove", {"element": "when", "object_id": iv["id"]})

nat=get(f"/rulesets/$FW?which=nat")["rules"]
assert nat, "no nat rules"
nid=nat[0]["id"]
orig=nat[0].get("action")
target="NATBranch" if orig != "NATBranch" else "Translate"
patched=patch(f"/rules/{nid}", {"action": target})
print("nat action", orig, "→", patched.get("action"))
assert patched.get("action")==target, patched
patch(f"/rules/{nid}", {"action": orig})

rt=get(f"/rulesets/$FW?which=routing")["rules"]
if rt:
  rrid=rt[0]["id"]
  m0=int(rt[0].get("metric") or 0)
  m1=m0+7
  mpat=patch(f"/rules/{rrid}", {"metric": m1})
  print("metric", m0, "→", mpat.get("metric"))
  assert int(mpat.get("metric"))==m1, mpat
  patch(f"/rules/{rrid}", {"metric": m0})
else:
  print("no routing rules — skip metric")

delete(f"/objects/{iv['id']}")
delete(f"/objects/{cust['id']}")
delete(f"/objects/{usr['id']}")
delete(f"/objects/{tag['id']}")
delete(f"/objects/{at['id']}")
print("cleaned")
PY

curl -sf -o /dev/null -w "%{http_code}\n" "${auth[@]}" -X POST \
  "http://127.0.0.1:$PORT/api/v1/projects/$SID/close" | grep -q 204
echo "OK: phase16 e2e passed"
