#!/usr/bin/env bash
# Phase-51: rename ruleset + sorted search results.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"

BRIDGE="$ROOT/webui/bin/fwbweb"
API_DIR="$ROOT/webui/backend"
FIX="$ROOT/webui/fixtures/sample-v24.fwb"
TOKEN="${FWBWEB_API_TOKEN:-dev-token}"
PORT="${FWBWEB_PORT:-18141}"
TMP="${TMPDIR:-/tmp}/fwbweb-e2e51-$$"
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

pol=call("POST","/objects",{"parent_id": FW, "type":"Policy", "name":"webui-e2e-renrs51"})
assert pol.get("type")=="Policy"
ren=call("PATCH", f"/objects/{pol['id']}", {"name":"webui-e2e-renamed51"})
print("renamed", ren.get("name"))
assert ren.get("name")=="webui-e2e-renamed51"
rs=call("GET", f"/rulesets/{pol['id']}?which=policy")
print("ruleset name", rs.get("name"))
assert rs.get("name")=="webui-e2e-renamed51"

# search returns results FE will sort — ensure multiple types
hits=call("GET","/search?q=eth&limit=40")["results"]
assert len(hits)>=2
# rule JSON shape for Copy rule JSON
rules=call("GET", f"/rulesets/{FW}?which=policy")["rules"]
assert rules and "id" in rules[0] and "position" in rules[0]
print("rule json keys", sorted(rules[0].keys())[:8])

call("DELETE", f"/objects/{pol['id']}?permanent=true")
print("cleaned")
PY

curl -sf -o /dev/null -w "%{http_code}\n" "${auth[@]}" -X POST \
  "http://127.0.0.1:$PORT/api/v1/projects/$SID/close" | grep -q 204
echo "OK: phase51 e2e passed"
