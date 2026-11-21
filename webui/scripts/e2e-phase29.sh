#!/usr/bin/env bash
# Phase-29: ICMP create attrs, object color, platforms catalog for create.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"

BRIDGE="$ROOT/webui/bin/fwbweb"
API_DIR="$ROOT/webui/backend"
FIX="$ROOT/webui/fixtures/sample-v24.fwb"
TOKEN="${FWBWEB_API_TOKEN:-dev-token}"
PORT="${FWBWEB_PORT:-18119}"
TMP="${TMPDIR:-/tmp}/fwbweb-e2e29-$$"
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

curl -sf "${auth[@]}" "http://127.0.0.1:$PORT/api/v1/platforms" >"$TMP/platforms.json"
curl -sf "${auth[@]}" -d "{\"path\":\"$FIX\",\"copy_to_workspace\":true}" \
  "http://127.0.0.1:$PORT/api/v1/projects/open" >"$TMP/open.json"
SID=$(python3 -c 'import json; print(json.load(open("'"$TMP"'/open.json"))["session_id"])')

python3 - <<PY
import json, urllib.request, urllib.error
H={"Authorization":"Bearer $TOKEN","Content-Type":"application/json"}
base=f"http://127.0.0.1:$PORT/api/v1/projects/$SID"
tmp="$TMP"

p=json.load(open(tmp+"/platforms.json"))
plats=[x["name"] for x in p.get("platforms") or []]
oses=[x["name"] for x in p.get("oses") or []]
print("platforms", len(plats), "oses", len(oses))
assert "nftables" in plats or "iptables" in plats, plats[:20]
assert oses, oses

def call(method, path, body=None):
    data=None if body is None else json.dumps(body).encode()
    req=urllib.request.Request(base+path, data=data, method=method, headers=H)
    try:
        with urllib.request.urlopen(req) as resp:
            raw=resp.read()
            return json.loads(raw) if raw else {"_status": resp.status}
    except urllib.error.HTTPError as e:
        raise AssertionError(f"{method} {path} -> {e.code}: {e.read().decode()}") from e

svcs=[r for r in call("GET","/search?q=Services&type=ServiceGroup&limit=20")["results"]
      if r["name"]=="Services" and not str(r["id"]).startswith("std")][0]["id"]
nets=[r for r in call("GET","/search?q=Networks&type=ObjectGroup&limit=20")["results"]
      if r["name"]=="Networks" and not str(r["id"]).startswith("std")][0]["id"]

icmp=call("POST","/objects",{
  "parent_id": svcs, "type":"ICMPService", "name":"webui-e2e-echo29",
  "attrs":{"type": 8, "code": 0, "color": "#ff6600"},
})
a=icmp.get("attrs") or {}
print("icmp", a)
assert int(a.get("type"))==8, a
assert int(a.get("code"))==0, a
assert str(a.get("color","")).lower().replace("#","") == "ff6600", a

icmp6=call("POST","/objects",{
  "parent_id": svcs, "type":"ICMP6Service", "name":"webui-e2e-echo6-29",
  "attrs":{"type": 128, "code": 0},
})
a6=icmp6.get("attrs") or {}
print("icmp6", a6)
assert int(a6.get("type"))==128, a6

net=call("POST","/objects",{
  "parent_id": nets, "type":"Network", "name":"webui-e2e-colored",
  "attrs":{"address":"10.77.0.0","netmask":"255.255.255.0","color":"#336699"},
})
ncol=str((net.get("attrs") or {}).get("color","")).lower().replace("#","")
print("net color", ncol)
assert ncol=="336699", net

FW="id2679X30989"
rules=call("GET", f"/rulesets/{FW}?which=policy")["rules"]
rid=rules[0]["id"]
dup=call("POST", f"/rules/{rid}/duplicate")
print("dup", dup.get("id"), "pos", dup.get("position"))
assert dup.get("id") and dup["id"]!=rid
call("DELETE", f"/rules/{dup['id']}")

call("DELETE", f"/objects/{icmp['id']}")
call("DELETE", f"/objects/{icmp6['id']}")
call("DELETE", f"/objects/{net['id']}")
print("cleaned")
PY

curl -sf -o /dev/null -w "%{http_code}\n" "${auth[@]}" -X POST \
  "http://127.0.0.1:$PORT/api/v1/projects/$SID/close" | grep -q 204
echo "OK: phase29 e2e passed"
