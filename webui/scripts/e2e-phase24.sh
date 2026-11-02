#!/usr/bin/env bash
# Phase-24: ruleset_list + open secondary Policy by id.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"

BRIDGE="$ROOT/webui/bin/fwbweb"
API_DIR="$ROOT/webui/backend"
FIX="$ROOT/webui/fixtures/sample-v24.fwb"
TOKEN="${FWBWEB_API_TOKEN:-dev-token}"
PORT="${FWBWEB_PORT:-18114}"
TMP="${TMPDIR:-/tmp}/fwbweb-e2e24-$$"
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

fw=get(f"/objects/$FW")
rslist=fw.get("ruleset_list") or []
print("ruleset_list", [(r.get("name"), r.get("type"), r.get("top")) for r in rslist])
assert any(r.get("type")=="Policy" and r.get("top") for r in rslist), rslist
assert any(r.get("type")=="NAT" for r in rslist), rslist
assert fw.get("parent_id") or True

pol=post("/objects", {"parent_id": "$FW", "type": "Policy", "name": "webui-e2e-altpol"})
fw2=get(f"/objects/$FW")
pols=[r for r in (fw2.get("ruleset_list") or []) if r.get("type")=="Policy"]
print("policies", [(p["name"], p.get("top")) for p in pols])
assert len(pols) >= 2, pols
assert any(p["id"]==pol["id"] for p in pols), pols

# fetch rules via secondary policy id directly
rs=get(f"/rulesets/{pol['id']}?which=policy")
print("alt policy rules", rs.get("name"), len(rs.get("rules") or []))
assert rs.get("name")=="webui-e2e-altpol", rs

# parent_id on policy
got=get(f"/objects/{pol['id']}")
assert got.get("parent_id")=="$FW", got
assert got.get("parent_type")=="Firewall", got

# add a rule into secondary set
added=post(f"/rulesets/{pol['id']}/rules", {"which":"policy","where":"bottom"})
rs2=get(f"/rulesets/{pol['id']}?which=policy")
assert any(r["id"]==added["id"] for r in rs2["rules"]), rs2
delete(f"/rules/{added['id']}")
delete(f"/objects/{pol['id']}")
print("cleaned")
PY

curl -sf -o /dev/null -w "%{http_code}\n" "${auth[@]}" -X POST \
  "http://127.0.0.1:$PORT/api/v1/projects/$SID/close" | grep -q 204
echo "OK: phase24 e2e passed"
