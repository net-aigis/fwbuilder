#!/usr/bin/env bash
# Phase-25: Firewall lastModified/lastCompiled timestamps + NetworkIPv6.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"

BRIDGE="$ROOT/webui/bin/fwbweb"
API_DIR="$ROOT/webui/backend"
FIX="$ROOT/webui/fixtures/sample-v24.fwb"
TOKEN="${FWBWEB_API_TOKEN:-dev-token}"
PORT="${FWBWEB_PORT:-18115}"
TMP="${TMPDIR:-/tmp}/fwbweb-e2e25-$$"
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
import json, urllib.request, time
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

before=get(f"/objects/$FW")
bmod=int((before.get("attrs") or {}).get("lastModified") or 0)
print("before lastModified", bmod)

# mutate a rule → bump lastModified
rules=get(f"/rulesets/$FW?which=policy")["rules"]
rid=rules[0]["id"]
time.sleep(1)
patch(f"/rules/{rid}", {"comment": "webui-e2e-stamp"})
after=get(f"/objects/$FW")
amod=int((after.get("attrs") or {}).get("lastModified") or 0)
print("after lastModified", amod)
assert amod >= bmod and amod > 0, (bmod, amod)
patch(f"/rules/{rid}", {"comment": ""})

# touch_compiled via compile endpoint
comp=post("/compile", {"firewall_id": "$FW"})
assert comp.get("ok") is True or comp.get("exit_code")==0 or "outputs" in comp, comp
fwc=get(f"/objects/$FW")
lc=int((fwc.get("attrs") or {}).get("lastCompiled") or 0)
print("lastCompiled", lc)
assert lc > 0, fwc.get("attrs")

# NetworkIPv6
nets=[r for r in get("/search?q=Networks&type=ObjectGroup&limit=20")["results"]
      if r["name"]=="Networks" and not str(r["id"]).startswith("std")][0]["id"]
n6=post("/objects", {
  "parent_id": nets,
  "type": "NetworkIPv6",
  "name": "webui-e2e-net6",
  "attrs": {"address": "2001:db8:1::", "netmask": "64"},
})
attrs=n6.get("attrs") or {}
print("net6", attrs)
assert attrs.get("address")=="2001:db8:1::", attrs
delete(f"/objects/{n6['id']}")
print("cleaned")
PY

curl -sf -o /dev/null -w "%{http_code}\n" "${auth[@]}" -X POST \
  "http://127.0.0.1:$PORT/api/v1/projects/$SID/close" | grep -q 204
echo "OK: phase25 e2e passed"
