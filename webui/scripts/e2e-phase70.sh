#!/usr/bin/env bash
# Phase-70: deleted list type-filter data (multiple types in trash).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"

BRIDGE="$ROOT/webui/bin/fwbweb"
API_DIR="$ROOT/webui/backend"
FIX="$ROOT/webui/fixtures/sample-v24.fwb"
TOKEN="${FWBWEB_API_TOKEN:-dev-token}"
PORT="${FWBWEB_PORT:-18170}"
TMP="${TMPDIR:-/tmp}/fwbweb-e2e70-$$"
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

def call(method, path, body=None):
    data=None if body is None else json.dumps(body).encode()
    req=urllib.request.Request(base+path, data=data, method=method, headers=H)
    try:
        with urllib.request.urlopen(req) as resp:
            raw=resp.read()
            return json.loads(raw) if raw else {"_status": resp.status}
    except urllib.error.HTTPError as e:
        raise AssertionError(f"{method} {path} -> {e.code}: {e.read().decode()}") from e

nets=[r for r in call("GET","/search?q=Networks&type=ObjectGroup&limit=20")["results"]
      if r["name"]=="Networks" and not str(r["id"]).startswith("std")][0]["id"]
svcs=[r for r in call("GET","/search?q=Services&type=ServiceGroup&limit=20")["results"]
      if r["name"]=="Services" and not str(r["id"]).startswith("std")][0]["id"]
n=call("POST","/objects",{"parent_id": nets, "type":"Network", "name":"webui-e2e-t70n",
  "attrs":{"address":"10.70.1.0","netmask":"255.255.255.0"}})
s=call("POST","/objects",{"parent_id": svcs, "type":"TCPService", "name":"webui-e2e-t70s",
  "attrs":{"dst_range_start":"7070","dst_range_end":"7070"}})
call("DELETE", f"/objects/{n['id']}?soft=true")
call("DELETE", f"/objects/{s['id']}?soft=true")
deleted=call("GET","/deleted")["objects"]
types=sorted({o.get("type") for o in deleted if o.get("id") in (n["id"], s["id"])})
print("trash types", types)
assert "Network" in types and "TCPService" in types
only_net=[o for o in deleted if o.get("type")=="Network" and o.get("id")==n["id"]]
assert only_net
print("filter Network", len(only_net))
call("DELETE", f"/objects/{n['id']}?permanent=true")
call("DELETE", f"/objects/{s['id']}?permanent=true")
print("cleaned")
PY

curl -sf -o /dev/null -w "%{http_code}\n" "${auth[@]}" -X POST \
  "http://127.0.0.1:$PORT/api/v1/projects/$SID/close" | grep -q 204
echo "OK: phase70 e2e passed"
