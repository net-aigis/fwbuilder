#!/usr/bin/env bash
# Phase-32: soft-delete / purge, TCP src+dst ports, deleted flag on objects.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"

BRIDGE="$ROOT/webui/bin/fwbweb"
API_DIR="$ROOT/webui/backend"
FIX="$ROOT/webui/fixtures/sample-v24.fwb"
TOKEN="${FWBWEB_API_TOKEN:-dev-token}"
PORT="${FWBWEB_PORT:-18122}"
TMP="${TMPDIR:-/tmp}/fwbweb-e2e32-$$"
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

svcs=[r for r in call("GET","/search?q=Services&type=ServiceGroup&limit=20")["results"]
      if r["name"]=="Services" and not str(r["id"]).startswith("std")][0]["id"]
nets=[r for r in call("GET","/search?q=Networks&type=ObjectGroup&limit=20")["results"]
      if r["name"]=="Networks" and not str(r["id"]).startswith("std")][0]["id"]

tcp=call("POST","/objects",{
  "parent_id": svcs, "type":"TCPService", "name":"webui-e2e-tcp32",
  "attrs":{"src_range_start":"1024","src_range_end":"1024",
           "dst_range_start":"443","dst_range_end":"443"},
})
a=tcp.get("attrs") or {}
print("tcp", a)
assert str(a.get("src_range_start"))=="1024", a
assert str(a.get("dst_range_start"))=="443", a

net=call("POST","/objects",{
  "parent_id": nets, "type":"Network", "name":"webui-e2e-softdel",
  "attrs":{"address":"10.88.0.0","netmask":"255.255.255.0"},
})
nid=net["id"]
soft=call("DELETE", f"/objects/{nid}?soft=true")
print("soft", soft)
assert soft.get("soft_deleted") is True, soft
gone=call("GET", f"/objects/{nid}")
print("after soft", gone.get("deleted"), gone.get("library_name"))
assert gone.get("deleted") is True, gone
# soft-deleted objects must not appear in search
hits=call("GET", f"/search?q=webui-e2e-softdel&type=Network&limit=20")["results"]
assert not any(h["id"]==nid for h in hits), hits

# restore via reparent back to Networks
restored=call("POST", f"/objects/{nid}/reparent", {"parent_id": nets})
print("restored parent", restored.get("parent_id"), "deleted", restored.get("deleted"))
assert restored.get("deleted") in (False, None), restored

# soft again then purge
call("DELETE", f"/objects/{nid}?soft=true")
purged=call("DELETE", f"/objects/{nid}")  # default permanent, or second from trash
print("purge", purged)
assert purged.get("purged") is True, purged
try:
    call("GET", f"/objects/{nid}")
    raise AssertionError("expected 404 after purge")
except AssertionError as e:
    if "expected 404" in str(e):
        raise
    assert "404" in str(e) or "not found" in str(e).lower(), e
    print("purge gone ok")

# permanent flag
net2=call("POST","/objects",{
  "parent_id": nets, "type":"Network", "name":"webui-e2e-perm32",
  "attrs":{"address":"10.89.0.0","netmask":"255.255.255.0"},
})
perm=call("DELETE", f"/objects/{net2['id']}?permanent=true")
print("permanent", perm)
assert perm.get("purged") is True, perm

call("DELETE", f"/objects/{tcp['id']}")
print("cleaned")
PY

curl -sf -o /dev/null -w "%{http_code}\n" "${auth[@]}" -X POST \
  "http://127.0.0.1:$PORT/api/v1/projects/$SID/close" | grep -q 204
echo "OK: phase32 e2e passed"
