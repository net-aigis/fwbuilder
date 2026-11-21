#!/usr/bin/env bash
# Phase-13: Interface under Firewall + Interval object.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"

BRIDGE="$ROOT/webui/bin/fwbweb"
API_DIR="$ROOT/webui/backend"
FIX="$ROOT/webui/fixtures/sample-v24.fwb"
TOKEN="${FWBWEB_API_TOKEN:-dev-token}"
PORT="${FWBWEB_PORT:-18102}"
TMP="${TMPDIR:-/tmp}/fwbweb-e2e13-$$"
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

def patch(path, body):
    data=json.dumps(body).encode()
    req=urllib.request.Request(base+path, data=data, method="PATCH", headers=H)
    return json.load(urllib.request.urlopen(req))

def delete(path):
    req=urllib.request.Request(base+path, method="DELETE", headers=H)
    return json.load(urllib.request.urlopen(req))

fw=[r for r in get("/search?q=&type=Firewall&limit=20")["results"]
    if not str(r["id"]).startswith("std")][0]["id"]
iface=post("/objects", {"parent_id": fw, "type": "Interface", "name": "webui-e2e-eth9"})
assert iface["type"]=="Interface", iface
print("iface", iface["id"], "host_OS", (iface.get("attrs") or {}).get("host_OS"))
ip=post("/objects", {
  "parent_id": iface["id"],
  "type": "IPv4",
  "name": "webui-e2e-eth9-ip",
  "attrs": {"address": "10.77.0.1", "netmask": "255.255.255.0"},
})
assert (ip.get("attrs") or {}).get("address")=="10.77.0.1", ip
print("ipv4", ip["id"])

# Interval under User Time (IntervalGroup)
times=[r for r in get("/search?q=Time&type=IntervalGroup&limit=20")["results"]
       if r["name"]=="Time" and not str(r["id"]).startswith("std")]
assert times, "no user Time IntervalGroup"
time_id=times[0]["id"]
print("time parent", time_id)
iv=post("/objects", {
  "parent_id": time_id,
  "type": "Interval",
  "name": "webui-e2e-bizhours",
  "attrs": {
    "from_hour": 9, "from_minute": 0,
    "to_hour": 17, "to_minute": 0,
    "days_of_week": "1,2,3,4,5",
  },
})
assert iv["type"]=="Interval", iv
attrs=(iv.get("attrs") or {})
# create response may already include attrs; refresh to be sure
got=get(f"/objects/{iv['id']}")
attrs=got.get("attrs") or attrs
print("interval attrs", {k: attrs.get(k) for k in ("from_hour","to_hour","days_of_week")})
assert int(attrs.get("from_hour"))==9, attrs
assert attrs.get("days_of_week")=="1,2,3,4,5", attrs
patched=patch(f"/objects/{iv['id']}", {"attrs": {"to_hour": 18}})
assert int((patched.get("attrs") or {}).get("to_hour"))==18, patched
print("interval ok")

delete(f"/objects/{iv['id']}")
delete(f"/objects/{ip['id']}")
delete(f"/objects/{iface['id']}")
print("cleaned")
PY

curl -sf -o /dev/null -w "%{http_code}\n" "${auth[@]}" -X POST \
  "http://127.0.0.1:$PORT/api/v1/projects/$SID/close" | grep -q 204
echo "OK: phase13 e2e passed"
