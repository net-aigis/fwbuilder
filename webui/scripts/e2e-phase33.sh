#!/usr/bin/env bash
# Phase-33: restore soft-deleted object + empty Deleted Objects.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"

BRIDGE="$ROOT/webui/bin/fwbweb"
API_DIR="$ROOT/webui/backend"
FIX="$ROOT/webui/fixtures/sample-v24.fwb"
TOKEN="${FWBWEB_API_TOKEN:-dev-token}"
PORT="${FWBWEB_PORT:-18123}"
TMP="${TMPDIR:-/tmp}/fwbweb-e2e33-$$"
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
objs=[r for r in call("GET","/search?q=Objects&type=ObjectGroup&limit=20")["results"]
      if r["name"]=="Objects" and not str(r["id"]).startswith("std")][0]["id"]

a=call("POST","/objects",{
  "parent_id": nets, "type":"Network", "name":"webui-e2e-restore33",
  "attrs":{"address":"10.33.0.0","netmask":"255.255.255.0"},
})
b=call("POST","/objects",{
  "parent_id": nets, "type":"Network", "name":"webui-e2e-trash33",
  "attrs":{"address":"10.34.0.0","netmask":"255.255.255.0"},
})
call("DELETE", f"/objects/{a['id']}?soft=true")
call("DELETE", f"/objects/{b['id']}?soft=true")
assert call("GET", f"/objects/{a['id']}").get("deleted") is True
assert call("GET", f"/objects/{b['id']}").get("deleted") is True

restored=call("POST", f"/objects/{a['id']}/reparent", {"parent_id": objs})
print("restored", restored.get("deleted"), restored.get("parent_id"))
assert restored.get("deleted") in (False, None), restored

emptied=call("POST", "/empty-deleted", {})
print("empty", emptied)
assert emptied.get("purged_count", 0) >= 1, emptied
# b should be gone; a was restored so still exists
try:
    call("GET", f"/objects/{b['id']}")
    raise AssertionError("expected 404 for purged trash item")
except AssertionError as e:
    if "expected 404" in str(e):
        raise
    assert "404" in str(e) or "not found" in str(e).lower(), e
alive=call("GET", f"/objects/{a['id']}")
assert alive.get("deleted") in (False, None), alive
call("DELETE", f"/objects/{a['id']}")
# empty when already empty
again=call("POST", "/empty-deleted", {})
print("empty again", again.get("purged_count"))
assert again.get("purged_count") == 0, again
print("cleaned")
PY

curl -sf -o /dev/null -w "%{http_code}\n" "${auth[@]}" -X POST \
  "http://127.0.0.1:$PORT/api/v1/projects/$SID/close" | grep -q 204
echo "OK: phase33 e2e passed"
