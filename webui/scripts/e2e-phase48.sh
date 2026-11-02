#!/usr/bin/env bash
# Phase-48: unused list JSON shape + single soft-delete from unused.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"

BRIDGE="$ROOT/webui/bin/fwbweb"
API_DIR="$ROOT/webui/backend"
FIX="$ROOT/webui/fixtures/sample-v24.fwb"
TOKEN="${FWBWEB_API_TOKEN:-dev-token}"
PORT="${FWBWEB_PORT:-18138}"
TMP="${TMPDIR:-/tmp}/fwbweb-e2e48-$$"
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
a=call("POST","/objects",{"parent_id": nets, "type":"Network", "name":"webui-e2e-u48a",
  "attrs":{"address":"10.48.1.0","netmask":"255.255.255.0"}})
b=call("POST","/objects",{"parent_id": nets, "type":"Network", "name":"webui-e2e-u48b",
  "attrs":{"address":"10.48.2.0","netmask":"255.255.255.0"}})
unused=call("GET","/unused?limit=200")
payload={"count": unused.get("count"), "objects": unused.get("objects")}
assert payload["count"] >= 2
assert any(o["id"]==a["id"] for o in payload["objects"])
# single soft-delete (per-row Delete in UI)
call("DELETE", f"/objects/{a['id']}?soft=true")
unused2=call("GET","/unused?limit=200")
ids={o["id"] for o in unused2.get("objects") or []}
assert a["id"] not in ids
assert b["id"] in ids
deleted=call("GET","/deleted")
assert any(o["id"]==a["id"] for o in deleted.get("objects") or [])
call("DELETE", f"/objects/{a['id']}?permanent=true")
call("DELETE", f"/objects/{b['id']}?permanent=true")
print("cleaned")
PY

curl -sf -o /dev/null -w "%{http_code}\n" "${auth[@]}" -X POST \
  "http://127.0.0.1:$PORT/api/v1/projects/$SID/close" | grep -q 204
echo "OK: phase48 e2e passed"
