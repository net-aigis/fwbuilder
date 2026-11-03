#!/usr/bin/env bash
# Phase-80: Gruppenfilter-Zyklus (all → jede Gruppe).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"

BRIDGE="$ROOT/webui/bin/fwbweb"
API_DIR="$ROOT/webui/backend"
FIX="$ROOT/webui/fixtures/sample-v24.fwb"
TOKEN="${FWBWEB_API_TOKEN:-dev-token}"
PORT="${FWBWEB_PORT:-18180}"
TMP="${TMPDIR:-/tmp}/fwbweb-e2e80-$$"
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

rules=call("GET", f"/rulesets/{FW}?which=policy")["rules"]
assert len(rules)>=2
r0, r1 = rules[0], rules[1]
call("PATCH", f"/rules/{r0['id']}", {"group": "webui-e2e-g80a"})
call("PATCH", f"/rules/{r1['id']}", {"group": "webui-e2e-g80b"})
chk=call("GET", f"/rulesets/{FW}?which=policy")["rules"]
groups=sorted({(r.get("group") or "").strip() for r in chk if (r.get("group") or "").strip()})
assert "webui-e2e-g80a" in groups and "webui-e2e-g80b" in groups
cycle=[""]+groups
counts=[]
for filt in cycle:
    if not filt:
        n=len(chk)
    else:
        q=filt.lower()
        n=len([r for r in chk if q in (r.get("group") or "").lower()])
    counts.append((filt or "all", n))
print("cycle group", counts)
assert sum(n for f,n in counts if f!="all")==counts[0][1]
assert all(n>=1 for f,n in counts if f!="all")
text=open("$ROOT/webui/frontend/src/shortcuts.ts").read()
assert 'keys: "u"' in text
# restore
call("PATCH", f"/rules/{r0['id']}", {"group": ""})
call("PATCH", f"/rules/{r1['id']}", {"group": ""})
print("cleaned")
PY

curl -sf -o /dev/null -w "%{http_code}\n" "${auth[@]}" -X POST \
  "http://127.0.0.1:$PORT/api/v1/projects/$SID/close" | grep -q 204
echo "OK: phase80 e2e passed"
