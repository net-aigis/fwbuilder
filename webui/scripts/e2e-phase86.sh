#!/usr/bin/env bash
# Phase-86: Regel hinzufügen (Insert/Ctrl+Enter Datenpfad) oben/unten.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"

BRIDGE="$ROOT/webui/bin/fwbweb"
API_DIR="$ROOT/webui/backend"
FIX="$ROOT/webui/fixtures/sample-v24.fwb"
TOKEN="${FWBWEB_API_TOKEN:-dev-token}"
PORT="${FWBWEB_PORT:-18186}"
TMP="${TMPDIR:-/tmp}/fwbweb-e2e86-$$"
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

before=call("GET", f"/rulesets/{FW}?which=policy")["rules"]
n0=len(before)
bottom=call("POST", f"/rulesets/{FW}/rules", {"which":"policy","where":"bottom"})
top=call("POST", f"/rulesets/{FW}/rules", {"which":"policy","where":"top"})
after=sorted(call("GET", f"/rulesets/{FW}?which=policy")["rules"], key=lambda r: r["position"])
assert len(after)==n0+2
assert after[0]["id"]==top["id"]
assert after[-1]["id"]==bottom["id"]
print("insert top", top["id"], "bottom", bottom["id"], "count", len(after))
call("DELETE", f"/rules/{top['id']}")
call("DELETE", f"/rules/{bottom['id']}")
left=call("GET", f"/rulesets/{FW}?which=policy")["rules"]
assert len(left)==n0
sc=open("$ROOT/webui/frontend/src/shortcuts.ts").read()
assert "Insert / Ctrl+Enter" in sc
print("cleaned")
PY

curl -sf -o /dev/null -w "%{http_code}\n" "${auth[@]}" -X POST \
  "http://127.0.0.1:$PORT/api/v1/projects/$SID/close" | grep -q 204
echo "OK: phase86 e2e passed"
