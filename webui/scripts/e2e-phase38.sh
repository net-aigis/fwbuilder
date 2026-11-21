#!/usr/bin/env bash
# Phase-38: restore to previous parent, object path, make ruleset top.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"

BRIDGE="$ROOT/webui/bin/fwbweb"
API_DIR="$ROOT/webui/backend"
FIX="$ROOT/webui/fixtures/sample-v24.fwb"
TOKEN="${FWBWEB_API_TOKEN:-dev-token}"
PORT="${FWBWEB_PORT:-18128}"
TMP="${TMPDIR:-/tmp}/fwbweb-e2e38-$$"
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
obj=call("POST","/objects",{
  "parent_id": nets, "type":"Network", "name":"webui-e2e-rest38",
  "attrs":{"address":"10.38.0.0","netmask":"255.255.255.0"},
})
oid=obj["id"]
path=call("GET", f"/objects/{oid}/path")
names=[p["name"] for p in path.get("path") or []]
print("path", names)
assert "Networks" in names and "webui-e2e-rest38" in names, names

soft=call("DELETE", f"/objects/{oid}?soft=true")
print("soft", soft.get("deleted_from_parent_id"))
assert soft.get("deleted_from_parent_id")==nets, soft
deleted=call("GET","/deleted")
row=next(o for o in deleted["objects"] if o["id"]==oid)
assert row.get("deleted_from_parent_id")==nets, row

restored=call("POST", f"/objects/{oid}/restore", {})
print("restored parent", restored.get("parent_id"), "deleted", restored.get("deleted"))
assert restored.get("parent_id")==nets, restored
assert restored.get("deleted") is False, restored
assert not restored.get("deleted_from_parent_id")

fw=[r for r in call("GET","/search?q=&type=Firewall&limit=20")["results"]
    if not str(r["id"]).startswith("std")][0]["id"]
pol=call("POST","/objects",{"parent_id": fw, "type":"Policy", "name":"webui-e2e-top38"})
assert str((pol.get("attrs") or {}).get("top")).lower() in ("false","0","")
prom=call("PATCH", f"/objects/{pol['id']}", {"attrs":{"top":"True"}})
print("top", (prom.get("attrs") or {}).get("top"))
assert str((prom.get("attrs") or {}).get("top")).lower() in ("true","1")

call("DELETE", f"/objects/{pol['id']}?permanent=true")
call("DELETE", f"/objects/{oid}?permanent=true")
print("cleaned")
PY

curl -sf -o /dev/null -w "%{http_code}\n" "${auth[@]}" -X POST \
  "http://127.0.0.1:$PORT/api/v1/projects/$SID/close" | grep -q 204
echo "OK: phase38 e2e passed"
