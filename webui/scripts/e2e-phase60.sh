#!/usr/bin/env bash
# Phase-60: firewall platform/OS on rules load + unused type filter data + tree JSON.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"

BRIDGE="$ROOT/webui/bin/fwbweb"
API_DIR="$ROOT/webui/backend"
FIX="$ROOT/webui/fixtures/sample-v24.fwb"
TOKEN="${FWBWEB_API_TOKEN:-dev-token}"
PORT="${FWBWEB_PORT:-18150}"
TMP="${TMPDIR:-/tmp}/fwbweb-e2e60-$$"
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
import json, urllib.request, urllib.error
H={"Authorization":"Bearer $TOKEN","Content-Type":"application/json"}
base=f"http://127.0.0.1:$PORT/api/v1/projects/$SID"
FW="$FW"

def call(method, path, body=None):
    data=None if body is None else json.dumps(body).encode()
    req=urllib.request.Request(base+path, data=data, method=method, headers=H)
    try:
        with urllib.request.urlopen(req) as resp:
            raw=resp.read()
            return json.loads(raw) if raw else {"_status": resp.status}
    except urllib.error.HTTPError as e:
        raise AssertionError(f"{method} {path} -> {e.code}: {e.read().decode()}") from e

fw=call("GET", f"/objects/{FW}")
attrs=fw.get("attrs") or {}
print("fw meta", fw.get("name"), attrs.get("platform"), attrs.get("host_OS"))
assert fw.get("name")
assert attrs.get("platform")
assert attrs.get("host_OS")

tree=call("GET","/tree?depth=2")
payload={"root": tree.get("root") or tree}
assert payload["root"].get("type")
print("tree root", payload["root"].get("type"), payload["root"].get("name"))

# Create two unused objects of different types for type-filter data
nets=[r for r in call("GET","/search?q=Networks&type=ObjectGroup&limit=20")["results"]
      if r["name"]=="Networks" and not str(r["id"]).startswith("std")][0]["id"]
svcs=[r for r in call("GET","/search?q=Services&type=ServiceGroup&limit=20")["results"]
      if r["name"]=="Services" and not str(r["id"]).startswith("std")][0]["id"]
n=call("POST","/objects",{"parent_id": nets, "type":"Network", "name":"webui-e2e-u60n",
  "attrs":{"address":"10.60.1.0","netmask":"255.255.255.0"}})
s=call("POST","/objects",{"parent_id": svcs, "type":"TCPService", "name":"webui-e2e-u60s",
  "attrs":{"dst_range_start":"8080","dst_range_end":"8080"}})
unused=call("GET","/unused?limit=200")
objs=unused.get("objects") or []
types=sorted({o.get("type") for o in objs if o.get("id") in (n["id"], s["id"])})
print("unused types sample", types)
assert "Network" in types and "TCPService" in types
filtered=[o for o in objs if o.get("type")=="Network" and o.get("id")==n["id"]]
assert filtered

call("DELETE", f"/objects/{n['id']}?permanent=true")
call("DELETE", f"/objects/{s['id']}?permanent=true")
print("cleaned")
PY

curl -sf -o /dev/null -w "%{http_code}\n" "${auth[@]}" -X POST \
  "http://127.0.0.1:$PORT/api/v1/projects/$SID/close" | grep -q 204
echo "OK: phase60 e2e passed"
