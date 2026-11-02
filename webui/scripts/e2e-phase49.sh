#!/usr/bin/env bash
# Phase-49: DynamicGroup create, tree depth=5, sessions list, where-used count.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"

BRIDGE="$ROOT/webui/bin/fwbweb"
API_DIR="$ROOT/webui/backend"
FIX="$ROOT/webui/fixtures/sample-v24.fwb"
TOKEN="${FWBWEB_API_TOKEN:-dev-token}"
PORT="${FWBWEB_PORT:-18139}"
TMP="${TMPDIR:-/tmp}/fwbweb-e2e49-$$"
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
print("sessions", sessions.get("count"), [s.get("session_id")=="$SID" or s.get("session_id") for s in sessions.get("sessions") or []][:3])
assert sessions.get("count")>=1
assert any(s.get("session_id")=="$SID" for s in sessions.get("sessions") or [])

tree5=call("GET","/tree?depth=5")
root=tree5.get("root") or {}
# User library should have nested children at depth 5
user=next(c for c in (root.get("children") or []) if c.get("name")=="User")
assert (user.get("children") or []), user
print("expand depth5 user kids", [c.get("name") for c in user.get("children") or []])

groups=[r for r in call("GET","/search?q=Groups&type=ObjectGroup&limit=20")["results"]
        if r["name"]=="Groups" and not str(r["id"]).startswith("std")][0]["id"]
dyn=call("POST","/objects",{"parent_id": groups, "type":"DynamicGroup", "name":"webui-e2e-dyn49"})
print("dyn", dyn.get("id"), dyn.get("type"))
assert dyn.get("type")=="DynamicGroup"
hits=call("GET","/search?q=webui-e2e-dyn49&type=DynamicGroup&limit=10")
assert any(r["id"]==dyn["id"] for r in hits.get("results") or [])

# where-used on AnyNetwork should be >0
wu=call("GET","/objects/sysid0/where-used")
print("where-used Any", wu.get("count"))
assert (wu.get("count") or 0) > 0

call("DELETE", f"/objects/{dyn['id']}?permanent=true")
print("cleaned")
PY

curl -sf -o /dev/null -w "%{http_code}\n" "${auth[@]}" -X POST \
  "http://127.0.0.1:$PORT/api/v1/projects/$SID/close" | grep -q 204
echo "OK: phase49 e2e passed"
