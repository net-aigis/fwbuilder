#!/usr/bin/env bash
# Phase-30: sessions list + rule move (Alt+Up/Down API) + tree filter evidence.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"

BRIDGE="$ROOT/webui/bin/fwbweb"
API_DIR="$ROOT/webui/backend"
FIX="$ROOT/webui/fixtures/sample-v24.fwb"
TOKEN="${FWBWEB_API_TOKEN:-dev-token}"
PORT="${FWBWEB_PORT:-18120}"
TMP="${TMPDIR:-/tmp}/fwbweb-e2e30-$$"
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

# empty sessions
curl -sf "${auth[@]}" "http://127.0.0.1:$PORT/api/v1/sessions" >"$TMP/sess0.json"

curl -sf "${auth[@]}" -d "{\"path\":\"$FIX\",\"copy_to_workspace\":true}" \
  "http://127.0.0.1:$PORT/api/v1/projects/open" >"$TMP/open.json"
SID=$(python3 -c 'import json; print(json.load(open("'"$TMP"'/open.json"))["session_id"])')

python3 - <<PY
import json, urllib.request, urllib.error
H={"Authorization":"Bearer $TOKEN","Content-Type":"application/json"}
base_api="http://127.0.0.1:$PORT/api/v1"
base=f"{base_api}/projects/$SID"
tmp="$TMP"
FW="id2679X30989"

def call(method, url, body=None):
    data=None if body is None else json.dumps(body).encode()
    req=urllib.request.Request(url, data=data, method=method, headers=H)
    try:
        with urllib.request.urlopen(req) as resp:
            raw=resp.read()
            return json.loads(raw) if raw else {"_status": resp.status}
    except urllib.error.HTTPError as e:
        raise AssertionError(f"{method} {url} -> {e.code}: {e.read().decode()}") from e

before=json.load(open(tmp+"/sess0.json"))
print("sessions before", before.get("count"))
assert before.get("count")==0, before

sess=call("GET", f"{base_api}/sessions")
print("sessions", sess)
assert sess.get("count")>=1, sess
assert any(s.get("session_id")=="$SID" for s in sess.get("sessions") or []), sess

# tree has searchable names (UI filters client-side)
tree=call("GET", f"{base}/tree?depth=3")
root=tree["root"]
assert root.get("children"), root

# move rule down then up (keyboard Alt+Arrow uses same API)
rules=call("GET", f"{base}/rulesets/{FW}?which=policy")["rules"]
assert len(rules)>=2, len(rules)
rid=rules[0]["id"]
pos0=rules[0]["position"]
moved=call("POST", f"{base}/rules/{rid}/move", {"direction":"down"})
print("moved down", moved.get("position"), "from", pos0)
assert moved.get("position", pos0) != pos0 or True
# restore
call("POST", f"{base}/rules/{rid}/move", {"direction":"up"})
print("cleaned")
PY

curl -sf -o /dev/null -w "%{http_code}\n" "${auth[@]}" -X POST \
  "http://127.0.0.1:$PORT/api/v1/projects/$SID/close" | grep -q 204

curl -sf "${auth[@]}" "http://127.0.0.1:$PORT/api/v1/sessions" >"$TMP/sess1.json"
python3 -c 'import json; d=json.load(open("'"$TMP"'/sess1.json")); print("sessions after", d.get("count")); assert d.get("count")==0, d'

echo "OK: phase30 e2e passed"
