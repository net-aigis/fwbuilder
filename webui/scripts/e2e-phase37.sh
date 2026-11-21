#!/usr/bin/env bash
# Phase-37: delete secondary ruleset + soft-delete unused batch path.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"

BRIDGE="$ROOT/webui/bin/fwbweb"
API_DIR="$ROOT/webui/backend"
FIX="$ROOT/webui/fixtures/sample-v24.fwb"
TOKEN="${FWBWEB_API_TOKEN:-dev-token}"
PORT="${FWBWEB_PORT:-18127}"
TMP="${TMPDIR:-/tmp}/fwbweb-e2e37-$$"
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
api=f"http://127.0.0.1:$PORT/api/v1"

def call(method, path, body=None, root=False):
    url=(api if root else base)+path
    data=None if body is None else json.dumps(body).encode()
    req=urllib.request.Request(url, data=data, method=method, headers=H)
    try:
        with urllib.request.urlopen(req) as resp:
            raw=resp.read()
            return json.loads(raw) if raw else {"_status": resp.status}
    except urllib.error.HTTPError as e:
        raise AssertionError(f"{method} {path} -> {e.code}: {e.read().decode()}") from e

sessions=call("GET","/sessions", root=True)
print("sessions", sessions.get("count"))
assert sessions.get("count")>=1

fw=[r for r in call("GET","/search?q=&type=Firewall&limit=20")["results"]
    if not str(r["id"]).startswith("std")][0]["id"]
pol=call("POST","/objects",{"parent_id": fw, "type":"Policy", "name":"webui-e2e-delpol37"})
print("secondary", pol["id"], pol.get("attrs",{}).get("top"))
assert str((pol.get("attrs") or {}).get("top")).lower() in ("false","0","")

# add a rule then permanently delete the ruleset
call("POST", f"/rulesets/{pol['id']}/rules", {"which":"policy","where":"bottom"})
rules=call("GET", f"/rulesets/{pol['id']}?which=policy")["rules"]
print("rules in secondary", len(rules))
assert len(rules)>=1

purged=call("DELETE", f"/objects/{pol['id']}?permanent=true")
print("purged ruleset", purged)
assert purged.get("purged") is True
# ruleset gone
try:
    call("GET", f"/rulesets/{pol['id']}?which=policy")
    raise AssertionError("ruleset still present")
except AssertionError as e:
    if "still present" in str(e):
        raise
    print("ruleset gone ok")

nets=[r for r in call("GET","/search?q=Networks&type=ObjectGroup&limit=20")["results"]
      if r["name"]=="Networks" and not str(r["id"]).startswith("std")][0]["id"]
a=call("POST","/objects",{"parent_id": nets, "type":"Network", "name":"webui-e2e-un37a",
  "attrs":{"address":"10.37.1.0","netmask":"255.255.255.0"}})
b=call("POST","/objects",{"parent_id": nets, "type":"Network", "name":"webui-e2e-un37b",
  "attrs":{"address":"10.37.2.0","netmask":"255.255.255.0"}})
unused=call("GET","/unused?limit=200")
uids={o["id"] for o in unused.get("objects") or []}
assert a["id"] in uids and b["id"] in uids, unused

# where-used on a used standard object should be >0
wu=call("GET","/objects/sysid0/where-used")
print("any where-used", wu.get("count"))
assert (wu.get("count") or 0) > 0

call("DELETE", f"/objects/{a['id']}?soft=true")
call("DELETE", f"/objects/{b['id']}?soft=true")
unused2=call("GET","/unused?limit=200")
uids2={o["id"] for o in unused2.get("objects") or []}
assert a["id"] not in uids2 and b["id"] not in uids2
deleted=call("GET","/deleted")
dids={o["id"] for o in deleted.get("objects") or []}
assert a["id"] in dids and b["id"] in dids
call("DELETE", f"/objects/{a['id']}?permanent=true")
call("DELETE", f"/objects/{b['id']}?permanent=true")
print("cleaned")
PY

curl -sf -o /dev/null -w "%{http_code}\n" "${auth[@]}" -X POST \
  "http://127.0.0.1:$PORT/api/v1/projects/$SID/close" | grep -q 204
echo "OK: phase37 e2e passed"
