#!/usr/bin/env bash
# Phase-17: insert before/after + IPv6/AttachedNetworks create.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"

BRIDGE="$ROOT/webui/bin/fwbweb"
API_DIR="$ROOT/webui/backend"
FIX="$ROOT/webui/fixtures/sample-v24.fwb"
TOKEN="${FWBWEB_API_TOKEN:-dev-token}"
PORT="${FWBWEB_PORT:-18107}"
TMP="${TMPDIR:-/tmp}/fwbweb-e2e17-$$"
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

def delete(path):
    req=urllib.request.Request(base+path, method="DELETE", headers=H)
    return json.load(urllib.request.urlopen(req))

rules=get(f"/rulesets/$FW?which=policy")["rules"]
base_count=len(rules)
anchor=rules[0]
apos=int(anchor["position"])
print("anchor", anchor["id"], "pos", apos, "count", base_count)

before=post(f"/rulesets/$FW/rules", {
  "which": "policy", "where": "before", "position": apos,
})
# re-read anchor position after shift
rules_mid=get(f"/rulesets/$FW?which=policy")["rules"]
anchor_pos=next(int(r["position"]) for r in rules_mid if r["id"]==anchor["id"])
after=post(f"/rulesets/$FW/rules", {
  "which": "policy", "where": "after", "position": anchor_pos,
})
print("before", before["id"], before["position"], "after", after["id"], after["position"])
rules2=sorted(get(f"/rulesets/$FW?which=policy")["rules"], key=lambda r: r["position"])
ids=[r["id"] for r in rules2]
assert before["id"] in ids and after["id"] in ids, ids
assert len(rules2)==base_count+2, (len(rules2), base_count)
ib=ids.index(before["id"])
ia=ids.index(anchor["id"])
io=ids.index(after["id"])
print("order indices", ib, ia, io)
assert ib < ia < io, (ib, ia, io, ids)

delete(f"/rules/{before['id']}")
delete(f"/rules/{after['id']}")

fw=[r for r in get("/search?q=&type=Firewall&limit=20")["results"]
    if not str(r["id"]).startswith("std")][0]["id"]
iface=post("/objects", {"parent_id": fw, "type": "Interface", "name": "webui-e2e-v6"})
ip6=post("/objects", {
  "parent_id": iface["id"],
  "type": "IPv6",
  "name": "webui-e2e-v6-addr",
  "attrs": {"address": "2001:db8::10", "netmask": "64"},
})
attrs=ip6.get("attrs") or {}
print("ipv6", attrs)
assert attrs.get("address")=="2001:db8::10", attrs
# netmask may be expanded; accept prefix or full
nm=str(attrs.get("netmask") or "")
assert nm in ("64", "ffff:ffff:ffff:ffff::", "ffff:ffff:ffff:ffff:0:0:0:0") or nm.startswith("ffff:ffff:ffff:ffff"), attrs

att=post("/objects", {
  "parent_id": iface["id"],
  "type": "AttachedNetworks",
  "name": "webui-e2e-attached",
})
assert att["type"]=="AttachedNetworks", att
print("attached", att["id"])

# tree includes library color attrs
tree=get("/tree?depth=2")
root=tree.get("root") or tree
libs=root.get("children") or []
user=[c for c in libs if c.get("name")=="User"]
assert user, {"keys": list(tree.keys()), "libs": [(c.get("name"), c.get("type")) for c in libs]}
ucolor=(user[0].get("attrs") or {}).get("color")
print("user library color", ucolor)
assert ucolor, user[0]

delete(f"/objects/{att['id']}")
delete(f"/objects/{ip6['id']}")
delete(f"/objects/{iface['id']}")
print("cleaned")
PY

curl -sf -o /dev/null -w "%{http_code}\n" "${auth[@]}" -X POST \
  "http://127.0.0.1:$PORT/api/v1/projects/$SID/close" | grep -q 204
echo "OK: phase17 e2e passed"
