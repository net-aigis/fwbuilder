#!/usr/bin/env bash
# Phase-59: move visible rules between Policy rulesets + sessions JSON shape.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"

BRIDGE="$ROOT/webui/bin/fwbweb"
API_DIR="$ROOT/webui/backend"
FIX="$ROOT/webui/fixtures/sample-v24.fwb"
TOKEN="${FWBWEB_API_TOKEN:-dev-token}"
PORT="${FWBWEB_PORT:-18149}"
TMP="${TMPDIR:-/tmp}/fwbweb-e2e59-$$"
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
root=f"http://127.0.0.1:$PORT/api/v1"
FW="$FW"

def call(method, path, body=None, absolute=False):
    url=(root+path) if absolute else (base+path)
    data=None if body is None else json.dumps(body).encode()
    req=urllib.request.Request(url, data=data, method=method, headers=H)
    try:
        with urllib.request.urlopen(req) as resp:
            raw=resp.read()
            return json.loads(raw) if raw else {"_status": resp.status}
    except urllib.error.HTTPError as e:
        raise AssertionError(f"{method} {path} -> {e.code}: {e.read().decode()}") from e

# Create secondary Policy; add two rules on top Policy; move them over
dup=call("POST","/objects",{"parent_id": FW, "type":"Policy", "name":"webui-e2e-pol59"})
a=call("POST", f"/rulesets/{FW}/rules", {"which":"policy","where":"bottom"})
b=call("POST", f"/rulesets/{FW}/rules", {"which":"policy","where":"bottom"})
src_before=len(call("GET", f"/rulesets/{FW}?which=policy")["rules"])
for rid in (a["id"], b["id"]):
    call("POST", f"/rules/{rid}/duplicate", {"ruleset_id": dup["id"]})
    call("DELETE", f"/rules/{rid}")
src_after=call("GET", f"/rulesets/{FW}?which=policy")["rules"]
dst=call("GET", f"/rulesets/{dup['id']}?which=policy")["rules"]
print("moved", len(dst), "src", src_before, "->", len(src_after))
assert len(dst)==2
assert len(src_after)==src_before-2
assert a["id"] not in {r["id"] for r in src_after}
assert b["id"] not in {r["id"] for r in src_after}

# Sessions JSON shape
sessions=call("GET","/sessions", absolute=True)
payload={"count": sessions.get("count"), "sessions": sessions.get("sessions") or []}
assert payload["count"]>=1
assert any(s.get("session_id")=="$SID" for s in payload["sessions"])
print("sessions payload count", payload["count"])

call("DELETE", f"/objects/{dup['id']}?permanent=true")
print("cleaned")
PY

curl -sf -o /dev/null -w "%{http_code}\n" "${auth[@]}" -X POST \
  "http://127.0.0.1:$PORT/api/v1/projects/$SID/close" | grep -q 204
echo "OK: phase59 e2e passed"
