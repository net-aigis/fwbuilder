#!/usr/bin/env bash
# Phase-14: Address/Network/AddressRange set via real InetAddr setters.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"

BRIDGE="$ROOT/webui/bin/fwbweb"
API_DIR="$ROOT/webui/backend"
FIX="$ROOT/webui/fixtures/sample-v24.fwb"
TOKEN="${FWBWEB_API_TOKEN:-dev-token}"
PORT="${FWBWEB_PORT:-18104}"
TMP="${TMPDIR:-/tmp}/fwbweb-e2e14-$$"
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
WORK=$(python3 -c 'import json; print(json.load(open("'"$TMP"'/open.json"))["work_path"])')

python3 - <<PY
import json, urllib.request
H={"Authorization":"Bearer $TOKEN","Content-Type":"application/json"}
base=f"http://127.0.0.1:$PORT/api/v1/projects/$SID"
WORK="$WORK"
SID="$SID"

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

def close(sid):
    req=urllib.request.Request(
      f"http://127.0.0.1:$PORT/api/v1/projects/{sid}/close",
      data=b"{}", method="POST", headers=H)
    urllib.request.urlopen(req).read()

nets=[r for r in get("/search?q=Networks&type=ObjectGroup&limit=20")["results"]
      if r["name"]=="Networks" and not str(r["id"]).startswith("std")][0]["id"]

net=post("/objects", {
  "parent_id": nets,
  "type": "Network",
  "name": "webui-e2e-addrnet",
  "attrs": {"address": "10.88.0.0", "netmask": "255.255.255.0"},
})
attrs=net.get("attrs") or {}
print("network", attrs)
assert attrs.get("address")=="10.88.0.0", attrs
assert attrs.get("netmask")=="255.255.255.0", attrs
# patch netmask via prefix length
patched=patch(f"/objects/{net['id']}", {"attrs": {"netmask": "24"}})
pattrs=patched.get("attrs") or {}
print("network prefix", pattrs.get("netmask"))
assert pattrs.get("netmask")=="255.255.255.0", pattrs

rng=post("/objects", {
  "parent_id": nets,
  "type": "AddressRange",
  "name": "webui-e2e-range",
  "attrs": {"start_address": "10.88.1.10", "end_address": "10.88.1.20"},
})
rattrs=rng.get("attrs") or {}
print("range", rattrs)
assert rattrs.get("start_address")=="10.88.1.10", rattrs
assert rattrs.get("end_address")=="10.88.1.20", rattrs

dns=post("/objects", {
  "parent_id": nets,
  "type": "DNSName",
  "name": "webui-e2e-dns",
  "attrs": {"dnsname": "example.test", "run_time": "True"},
})
dattrs=dns.get("attrs") or {}
print("dns", dattrs)
assert dattrs.get("dnsname")=="example.test", dattrs
assert str(dattrs.get("run_time")).lower() in ("true", "1"), dattrs

# save, copy out of session workspace (close deletes it), reopen
import shutil, os
save=post("/save", {})
print("saved bridge path", save.get("path"), "host work", WORK)
assert os.path.isfile(WORK), WORK
kept=os.path.join("$TMP", "addr-roundtrip.fwb")
shutil.copy2(WORK, kept)
close(SID)
open2=json.load(urllib.request.urlopen(urllib.request.Request(
  f"http://127.0.0.1:$PORT/api/v1/projects/open",
  data=json.dumps({"path": kept, "copy_to_workspace": True}).encode(),
  method="POST", headers=H)))
sid2=open2["session_id"]
base=f"http://127.0.0.1:$PORT/api/v1/projects/{sid2}"
again=get(f"/objects/{net['id']}")
print("reloaded network", again.get("attrs"))
assert (again.get("attrs") or {}).get("address")=="10.88.0.0", again
assert (again.get("attrs") or {}).get("netmask")=="255.255.255.0", again
again_r=get(f"/objects/{rng['id']}")
assert (again_r.get("attrs") or {}).get("start_address")=="10.88.1.10", again_r
print("roundtrip ok")
close(sid2)
print("cleaned")
PY

echo "OK: phase14 e2e passed"
