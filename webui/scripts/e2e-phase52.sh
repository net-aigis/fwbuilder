#!/usr/bin/env bash
# Phase-52: secondary NAT create + disabled count + search JSON shape.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"

BRIDGE="$ROOT/webui/bin/fwbweb"
API_DIR="$ROOT/webui/backend"
FIX="$ROOT/webui/fixtures/sample-v24.fwb"
TOKEN="${FWBWEB_API_TOKEN:-dev-token}"
PORT="${FWBWEB_PORT:-18142}"
TMP="${TMPDIR:-/tmp}/fwbweb-e2e52-$$"
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

nat=call("POST","/objects",{"parent_id": FW, "type":"NAT", "name":"webui-e2e-nat52"})
print("nat", nat.get("id"), nat.get("type"), (nat.get("attrs") or {}).get("top"))
assert nat.get("type")=="NAT"
assert str((nat.get("attrs") or {}).get("top")).lower() in ("false","0","")

rules=call("GET", f"/rulesets/{FW}?which=policy")["rules"]
assert len(rules)>=1
rid=rules[0]["id"]
call("PATCH", f"/rules/{rid}", {"disabled": True})
chk=call("GET", f"/rulesets/{FW}?which=policy")["rules"]
disabled=sum(1 for r in chk if r.get("disabled"))
print("disabled", disabled)
assert disabled>=1
# Home/End FE uses visible list — API still returns all; restore
call("PATCH", f"/rules/{rid}", {"disabled": False})

hits=call("GET","/search?q=eth&limit=40")
payload={"count": hits.get("count"), "results": hits.get("results")}
assert payload["count"]>=1 and payload["results"]
print("search json count", payload["count"])

fw=call("GET", f"/objects/{FW}")
nats=[r for r in (fw.get("ruleset_list") or []) if r.get("type")=="NAT"]
assert any(r.get("id")==nat["id"] for r in nats), nats

call("DELETE", f"/objects/{nat['id']}?permanent=true")
print("cleaned")
PY

curl -sf -o /dev/null -w "%{http_code}\n" "${auth[@]}" -X POST \
  "http://127.0.0.1:$PORT/api/v1/projects/$SID/close" | grep -q 204
echo "OK: phase52 e2e passed"
