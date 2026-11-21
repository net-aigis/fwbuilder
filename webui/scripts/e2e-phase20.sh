#!/usr/bin/env bash
# Phase-20: create Firewall + Interface management flag.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"

BRIDGE="$ROOT/webui/bin/fwbweb"
API_DIR="$ROOT/webui/backend"
FIX="$ROOT/webui/fixtures/sample-v24.fwb"
TOKEN="${FWBWEB_API_TOKEN:-dev-token}"
PORT="${FWBWEB_PORT:-18110}"
TMP="${TMPDIR:-/tmp}/fwbweb-e2e20-$$"
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

fws=[r for r in get("/search?q=Firewalls&type=ObjectGroup&limit=20")["results"]
     if r["name"]=="Firewalls" and not str(r["id"]).startswith("std")][0]["id"]
fw=post("/objects", {
  "parent_id": fws,
  "type": "Firewall",
  "name": "webui-e2e-newfw",
  "attrs": {"platform": "nftables", "host_OS": "linux24"},
})
print("firewall", fw["id"], (fw.get("attrs") or {}).get("platform"))
assert fw["type"]=="Firewall", fw
assert (fw.get("attrs") or {}).get("platform")=="nftables", fw
# created firewall should expose policy ruleset
got=get(f"/objects/{fw['id']}")
sets=(got.get("rulesets") or {})
print("rulesets", sets)
assert sets.get("policy"), sets

iface=post("/objects", {"parent_id": fw["id"], "type": "Interface", "name": "eth0"})
patched=patch(f"/objects/{iface['id']}", {"attrs": {"management": "True", "label": "mgmt"}})
attrs=patched.get("attrs") or {}
print("iface", attrs.get("management"), attrs.get("label"))
assert str(attrs.get("management")).lower() in ("true","1"), attrs
assert attrs.get("label")=="mgmt", attrs

# extra Policy under firewall
pol=post("/objects", {"parent_id": fw["id"], "type": "Policy", "name": "extra-pol"})
assert pol["type"]=="Policy", pol

delete(f"/objects/{pol['id']}")
delete(f"/objects/{iface['id']}")
delete(f"/objects/{fw['id']}")
print("cleaned")
PY

curl -sf -o /dev/null -w "%{http_code}\n" "${auth[@]}" -X POST \
  "http://127.0.0.1:$PORT/api/v1/projects/$SID/close" | grep -q 204
echo "OK: phase20 e2e passed"
