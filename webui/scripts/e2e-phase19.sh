#!/usr/bin/env bash
# Phase-19: rule branch target + download .fwb.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"

BRIDGE="$ROOT/webui/bin/fwbweb"
API_DIR="$ROOT/webui/backend"
FIX="$ROOT/webui/fixtures/sample-v24.fwb"
TOKEN="${FWBWEB_API_TOKEN:-dev-token}"
PORT="${FWBWEB_PORT:-18109}"
TMP="${TMPDIR:-/tmp}/fwbweb-e2e19-$$"
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

# create a second Policy ruleset under the firewall for branching
pol=post("/objects", {"parent_id": "$FW", "type": "Policy", "name": "webui-e2e-branch-pol"})
assert pol["type"]=="Policy", pol
print("branch policy", pol["id"])

rules=get(f"/rulesets/$FW?which=policy")["rules"]
rid=rules[0]["id"]
orig_action=rules[0].get("action")
patched=patch(f"/rules/{rid}", {"action": "Branch", "branch_id": pol["id"]})
print("branch", patched.get("action"), patched.get("branch_id"), patched.get("branch_name"))
assert patched.get("action")=="Branch", patched
assert patched.get("branch_id")==pol["id"], patched
assert patched.get("branch_name")=="webui-e2e-branch-pol", patched

cleared=patch(f"/rules/{rid}", {"branch_id": "", "action": orig_action})
assert not cleared.get("branch_id"), cleared
print("cleared branch, action", cleared.get("action"))

# download saves and returns the fwb
req=urllib.request.Request(base+"/download", headers={"Authorization":"Bearer $TOKEN"})
with urllib.request.urlopen(req) as resp:
    data=resp.read()
    ctype=resp.headers.get("Content-Type","")
print("download bytes", len(data), "ctype", ctype)
assert len(data) > 100, len(data)
assert b"<FWObjectDatabase" in data or b"FWObjectDatabase" in data, data[:200]

# cleanup branch policy (rules restored)
from urllib.request import Request
delete=lambda path: urllib.request.urlopen(Request(base+path, method="DELETE", headers=H)).read()
delete(f"/objects/{pol['id']}")
print("cleaned")
PY

curl -sf -o /dev/null -w "%{http_code}\n" "${auth[@]}" -X POST \
  "http://127.0.0.1:$PORT/api/v1/projects/$SID/close" | grep -q 204
echo "OK: phase19 e2e passed"
