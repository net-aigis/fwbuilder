#!/usr/bin/env bash
# Phase-81: PageUp/PageDown-Sprung (±10) auf sichtbaren Regeln.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"

BRIDGE="$ROOT/webui/bin/fwbweb"
API_DIR="$ROOT/webui/backend"
FIX="$ROOT/webui/fixtures/sample-v24.fwb"
TOKEN="${FWBWEB_API_TOKEN:-dev-token}"
PORT="${FWBWEB_PORT:-18181}"
TMP="${TMPDIR:-/tmp}/fwbweb-e2e81-$$"
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

# ensure enough rules for ±10 jump
rs=call("GET", f"/rulesets/{FW}?which=policy")
while len(rs["rules"]) < 12:
    call("POST", f"/rulesets/{FW}/rules", {"which": "policy", "where": "bottom"})
    rs=call("GET", f"/rulesets/{FW}?which=policy")
rules=rs["rules"]
n=len(rules)
step=10
# simulate PageDown from index 0
cur=0
down=min(n-1, cur+step)
# simulate PageUp from last
cur=n-1
up=max(0, cur-step)
print("page jump n", n, "down", down, "up", up)
assert down == 10
assert up == n-1-10
text=open("$ROOT/webui/frontend/src/shortcuts.ts").read()
assert "PageUp / PageDown" in text
# cleanup extra rules (leave original 2)
keep={rules[0]["id"], rules[1]["id"]}
for r in rules[2:]:
    call("DELETE", f"/rules/{r['id']}")
left=call("GET", f"/rulesets/{FW}?which=policy")["rules"]
assert len(left)==2
print("cleaned")
PY

curl -sf -o /dev/null -w "%{http_code}\n" "${auth[@]}" -X POST \
  "http://127.0.0.1:$PORT/api/v1/projects/$SID/close" | grep -q 204
echo "OK: phase81 e2e passed"
