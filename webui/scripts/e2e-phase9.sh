#!/usr/bin/env bash
# Phase-9: duplicate + reparent objects.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"

BRIDGE="$ROOT/webui/bin/fwbweb"
API_DIR="$ROOT/webui/backend"
FIX="$ROOT/webui/fixtures/sample-v24.fwb"
TOKEN="${FWBWEB_API_TOKEN:-dev-token}"
PORT="${FWBWEB_PORT:-18097}"
TMP="${TMPDIR:-/tmp}/fwbweb-e2e9-$$"
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

python3 - <<PY
import json, urllib.request
H={"Authorization":"Bearer $TOKEN","Content-Type":"application/json"}
base=f"http://127.0.0.1:$PORT/api/v1/projects/$SID"

def get(path):
    return json.load(urllib.request.urlopen(urllib.request.Request(base+path, headers=H)))

def post(path, body):
    data=json.dumps(body).encode()
    req=urllib.request.Request(base+path, data=data, method="POST", headers=H)
    return json.load(urllib.request.urlopen(req))

def delete(path):
    req=urllib.request.Request(base+path, method="DELETE", headers=H)
    return json.load(urllib.request.urlopen(req))

nets=[r for r in get("/search?q=Networks&type=ObjectGroup&limit=20")["results"]
      if r["name"]=="Networks" and not str(r["id"]).startswith("std")]
objs=[r for r in get("/search?q=Objects&type=ObjectGroup&limit=20")["results"]
      if r["name"]=="Objects" and not str(r["id"]).startswith("std")]
assert nets and objs, (nets, objs)
nets_id, objs_id = nets[0]["id"], objs[0]["id"]
print("nets", nets_id, "objects", objs_id)

created=post("/objects", {
  "parent_id": nets_id,
  "type": "Network",
  "name": "webui-e2e-move",
  "attrs": {"address": "10.55.0.0", "netmask": "255.255.255.0"},
})
oid=created["id"]
print("created", oid)

copy=post(f"/objects/{oid}/duplicate", {"name": "webui-e2e-move Copy"})
cid=copy["id"]
assert cid != oid, copy
print("copy", cid)

moved=post(f"/objects/{cid}/reparent", {"parent_id": objs_id})
assert moved.get("id")==cid, moved
print("reparented ok")

delete(f"/objects/{cid}")
delete(f"/objects/{oid}")
print("cleaned")
PY

curl -sf -o /dev/null -w "%{http_code}\n" "${auth[@]}" -X POST \
  "http://127.0.0.1:$PORT/api/v1/projects/$SID/close" | grep -q 204
echo "OK: phase9 e2e passed"
