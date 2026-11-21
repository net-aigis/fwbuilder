#!/usr/bin/env bash
# Phase-15: remove rule refs + Interface physAddress/label + object color.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"

BRIDGE="$ROOT/webui/bin/fwbweb"
API_DIR="$ROOT/webui/backend"
FIX="$ROOT/webui/fixtures/sample-v24.fwb"
TOKEN="${FWBWEB_API_TOKEN:-dev-token}"
PORT="${FWBWEB_PORT:-18105}"
TMP="${TMPDIR:-/tmp}/fwbweb-e2e15-$$"
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

# --- Interface phys_address + label ---
fw=[r for r in get("/search?q=&type=Firewall&limit=20")["results"]
    if not str(r["id"]).startswith("std")][0]["id"]
iface=post("/objects", {"parent_id": fw, "type": "Interface", "name": "webui-e2e-mac"})
patched=patch(f"/objects/{iface['id']}", {
  "attrs": {"phys_address": "aa:bb:cc:dd:ee:ff", "label": "e2e-mac", "color": "#ffcc00"},
})
attrs=patched.get("attrs") or {}
print("iface attrs", {k: attrs.get(k) for k in ("phys_address","label","color")})
assert attrs.get("phys_address")=="aa:bb:cc:dd:ee:ff", attrs
assert attrs.get("label")=="e2e-mac", attrs
assert attrs.get("color")=="#ffcc00", attrs
got=get(f"/objects/{iface['id']}")
gattrs=got.get("attrs") or {}
assert gattrs.get("phys_address")=="aa:bb:cc:dd:ee:ff", gattrs
assert gattrs.get("label")=="e2e-mac", gattrs
print("phys_address/label/color ok")

# --- color on Network ---
nets=[r for r in get("/search?q=Networks&type=ObjectGroup&limit=20")["results"]
      if r["name"]=="Networks" and not str(r["id"]).startswith("std")][0]["id"]
net=post("/objects", {
  "parent_id": nets,
  "type": "Network",
  "name": "webui-e2e-color",
  "attrs": {"address": "10.99.0.0", "netmask": "255.255.255.0", "color": "#00aaff"},
})
nattrs=net.get("attrs") or {}
assert nattrs.get("color")=="#00aaff", nattrs
print("network color ok")

# --- remove rule ref ---
rules=get(f"/rulesets/$FW?which=policy")["rules"]
rid=rules[0]["id"]
# ensure a known ref: add network then remove it
added=post(f"/rules/{rid}/refs", {"element": "src", "object_id": net["id"]})
objs=(added.get("src") or {}).get("objects") or []
ids=[o["id"] for o in objs]
print("after add", ids)
assert net["id"] in ids, ids
removed=post(f"/rules/{rid}/refs/remove", {"element": "src", "object_id": net["id"]})
objs2=(removed.get("src") or {}).get("objects") or []
ids2=[o["id"] for o in objs2]
print("after remove", ids2)
assert net["id"] not in ids2, ids2
print("remove ref ok")

delete(f"/objects/{net['id']}")
delete(f"/objects/{iface['id']}")
print("cleaned")
PY

curl -sf -o /dev/null -w "%{http_code}\n" "${auth[@]}" -X POST \
  "http://127.0.0.1:$PORT/api/v1/projects/$SID/close" | grep -q 204
echo "OK: phase15 e2e passed"
