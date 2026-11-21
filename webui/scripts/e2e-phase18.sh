#!/usr/bin/env bash
# Phase-18: object lock/unlock + TCPUDPService.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"

BRIDGE="$ROOT/webui/bin/fwbweb"
API_DIR="$ROOT/webui/backend"
FIX="$ROOT/webui/fixtures/sample-v24.fwb"
TOKEN="${FWBWEB_API_TOKEN:-dev-token}"
PORT="${FWBWEB_PORT:-18108}"
TMP="${TMPDIR:-/tmp}/fwbweb-e2e18-$$"
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
import json, urllib.request, urllib.error
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

net=post("/objects", {
  "parent_id": nets,
  "type": "Network",
  "name": "webui-e2e-lock",
  "attrs": {"address": "10.66.0.0", "netmask": "255.255.255.0"},
})
assert not net.get("ro"), net
locked=post(f"/objects/{net['id']}/ro", {"ro": True})
assert locked.get("ro") is True, locked
print("locked", locked["id"])
try:
  patch(f"/objects/{net['id']}", {"comment": "should fail"})
  raise SystemExit("expected patch on locked object to fail")
except urllib.error.HTTPError as e:
  assert e.code==400, e
  print("patch blocked while locked")
unlocked=post(f"/objects/{net['id']}/ro", {"ro": False})
assert unlocked.get("ro") is False, unlocked
patched=patch(f"/objects/{net['id']}", {"comment": "unlocked-ok"})
assert patched.get("comment")=="unlocked-ok", patched
print("unlock ok")

# Standard Any must stay locked
try:
  post("/objects/sysid0/ro", {"ro": False})
  raise SystemExit("expected Standard unlock to fail")
except urllib.error.HTTPError as e:
  assert e.code==400, e
  print("standard unlock blocked")

icmp6=post("/objects", {
  "parent_id": svcs,
  "type": "ICMP6Service",
  "name": "webui-e2e-icmp6",
  "attrs": {"type": 128, "code": 0},
})
attrs=icmp6.get("attrs") or {}
print("icmp6", attrs)
assert int(attrs.get("type"))==128, attrs
assert icmp6["type"]=="ICMP6Service", icmp6

delete(f"/objects/{icmp6['id']}")
delete(f"/objects/{net['id']}")
print("cleaned")
PY

curl -sf -o /dev/null -w "%{http_code}\n" "${auth[@]}" -X POST \
  "http://127.0.0.1:$PORT/api/v1/projects/$SID/close" | grep -q 204
echo "OK: phase18 e2e passed"
