#!/usr/bin/env bash
# Phase-39: restore-all trash path + object JSON fields + tree depth=1.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"

BRIDGE="$ROOT/webui/bin/fwbweb"
API_DIR="$ROOT/webui/backend"
FIX="$ROOT/webui/fixtures/sample-v24.fwb"
TOKEN="${FWBWEB_API_TOKEN:-dev-token}"
PORT="${FWBWEB_PORT:-18129}"
TMP="${TMPDIR:-/tmp}/fwbweb-e2e39-$$"
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

# collapse-equivalent: depth=1 tree still has libraries
tree1=call("GET","/tree?depth=1")
kids=(tree1.get("root") or {}).get("children") or []
print("depth1 libs", [c.get("name") for c in kids])
assert any(c.get("name")=="User" for c in kids)

nets=[r for r in call("GET","/search?q=Networks&type=ObjectGroup&limit=20")["results"]
      if r["name"]=="Networks" and not str(r["id"]).startswith("std")][0]["id"]
ids=[]
for i, addr in enumerate(("10.39.1.0","10.39.2.0")):
    o=call("POST","/objects",{
      "parent_id": nets, "type":"Network", "name":f"webui-e2e-rall39-{i}",
      "attrs":{"address":addr,"netmask":"255.255.255.0"},
    })
    ids.append(o["id"])
    # JSON-shaped object payload for Copy JSON
    full=call("GET", f"/objects/{o['id']}")
    assert full.get("id")==o["id"] and full.get("type")=="Network"
    assert "attrs" in full
    call("DELETE", f"/objects/{o['id']}?soft=true")

deleted=call("GET","/deleted")
dids={o["id"] for o in deleted.get("objects") or []}
assert set(ids) <= dids
for oid in ids:
    row=next(o for o in deleted["objects"] if o["id"]==oid)
    assert row.get("deleted_from_parent_id")==nets, row

for oid in ids:
    r=call("POST", f"/objects/{oid}/restore", {})
    assert r.get("parent_id")==nets and r.get("deleted") is False

deleted2=call("GET","/deleted")
dids2={o["id"] for o in deleted2.get("objects") or []}
assert not (set(ids) & dids2)
for oid in ids:
    call("DELETE", f"/objects/{oid}?permanent=true")
print("cleaned")
PY

curl -sf -o /dev/null -w "%{http_code}\n" "${auth[@]}" -X POST \
  "http://127.0.0.1:$PORT/api/v1/projects/$SID/close" | grep -q 204
echo "OK: phase39 e2e passed"
