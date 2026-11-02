#!/usr/bin/env bash
# Phase-50: DynamicGroup filter attrs + duplicate Firewall.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"

BRIDGE="$ROOT/webui/bin/fwbweb"
API_DIR="$ROOT/webui/backend"
FIX="$ROOT/webui/fixtures/sample-v24.fwb"
TOKEN="${FWBWEB_API_TOKEN:-dev-token}"
PORT="${FWBWEB_PORT:-18140}"
TMP="${TMPDIR:-/tmp}/fwbweb-e2e50-$$"
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

groups=[r for r in call("GET","/search?q=Groups&type=ObjectGroup&limit=20")["results"]
        if r["name"]=="Groups" and not str(r["id"]).startswith("std")][0]["id"]
dyn=call("POST","/objects",{"parent_id": groups, "type":"DynamicGroup", "name":"webui-e2e-dyn50"})
upd=call("PATCH", f"/objects/{dyn['id']}", {"attrs":{"filter":"Network,dmz\nHost,web"}})
filt=str((upd.get("attrs") or {}).get("filter") or "")
print("filter", repr(filt))
assert "Network,dmz" in filt.replace(" ", "")
assert "Host,web" in filt.replace(" ", "")
# roundtrip get
got=call("GET", f"/objects/{dyn['id']}")
gfilt=str((got.get("attrs") or {}).get("filter") or "")
assert "Network,dmz" in gfilt and "Host,web" in gfilt

fw=call("GET", f"/objects/{FW}")
dup=call("POST", f"/objects/{FW}/duplicate", {})
print("dup fw", dup.get("name"), dup.get("type"), dup.get("id"))
assert dup.get("type")=="Firewall"
assert dup.get("id")!=FW
assert (dup.get("rulesets") or {}).get("policy")
# cleanup
call("DELETE", f"/objects/{dup['id']}?permanent=true")
call("DELETE", f"/objects/{dyn['id']}?permanent=true")
print("cleaned")
PY

curl -sf -o /dev/null -w "%{http_code}\n" "${auth[@]}" -X POST \
  "http://127.0.0.1:$PORT/api/v1/projects/$SID/close" | grep -q 204
echo "OK: phase50 e2e passed"
