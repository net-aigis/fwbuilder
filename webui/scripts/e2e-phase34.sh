#!/usr/bin/env bash
# Phase-34: list deleted, toggle logging/direction, bulk comment.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"

BRIDGE="$ROOT/webui/bin/fwbweb"
API_DIR="$ROOT/webui/backend"
FIX="$ROOT/webui/fixtures/sample-v24.fwb"
TOKEN="${FWBWEB_API_TOKEN:-dev-token}"
PORT="${FWBWEB_PORT:-18124}"
TMP="${TMPDIR:-/tmp}/fwbweb-e2e34-$$"
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

nets=[r for r in call("GET","/search?q=Networks&type=ObjectGroup&limit=20")["results"]
      if r["name"]=="Networks" and not str(r["id"]).startswith("std")][0]["id"]
before=call("GET","/deleted")
print("deleted before", before.get("count"))
n=call("POST","/objects",{
  "parent_id": nets, "type":"Network", "name":"webui-e2e-trash34",
  "attrs":{"address":"10.34.1.0","netmask":"255.255.255.0"},
})
call("DELETE", f"/objects/{n['id']}?soft=true")
after=call("GET","/deleted")
print("deleted after soft", after.get("count"), [o["name"] for o in after.get("objects") or []])
assert after.get("count", 0) >= before.get("count", 0) + 1, (before, after)
assert any(o["id"]==n["id"] for o in after.get("objects") or []), after

rules=call("GET", f"/rulesets/{FW}?which=policy")["rules"]
assert rules, rules
r0=rules[0]
rid=r0["id"]
was_log=bool(r0.get("logging"))
patched=call("PATCH", f"/rules/{rid}", {"logging": not was_log})
print("logging", was_log, "->", patched.get("logging"))
assert bool(patched.get("logging")) == (not was_log), patched
# restore
call("PATCH", f"/rules/{rid}", {"logging": was_log})

was_dir=str(r0.get("direction") or "Both")
order=["Inbound","Outbound","Both"]
nxt=order[(order.index(was_dir) + 1) % len(order)] if was_dir in order else "Both"
dpat=call("PATCH", f"/rules/{rid}", {"direction": nxt})
print("direction", was_dir, "->", dpat.get("direction"))
assert dpat.get("direction")==nxt, dpat
call("PATCH", f"/rules/{rid}", {"direction": was_dir})

# bulk comment two rules
r1=rules[1] if len(rules)>1 else rules[0]
call("PATCH", f"/rules/{rid}", {"comment": "webui-e2e-bulk34"})
call("PATCH", f"/rules/{r1['id']}", {"comment": "webui-e2e-bulk34"})
chk=call("GET", f"/rulesets/{FW}?which=policy")["rules"]
by={x["id"]: x for x in chk}
assert by[rid].get("comment")=="webui-e2e-bulk34"
assert by[r1["id"]].get("comment")=="webui-e2e-bulk34"
call("PATCH", f"/rules/{rid}", {"comment": r0.get("comment") or ""})
call("PATCH", f"/rules/{r1['id']}", {"comment": r1.get("comment") or ""})

call("DELETE", f"/objects/{n['id']}")  # purge from trash
print("cleaned")
PY

curl -sf -o /dev/null -w "%{http_code}\n" "${auth[@]}" -X POST \
  "http://127.0.0.1:$PORT/api/v1/projects/$SID/close" | grep -q 204
echo "OK: phase34 e2e passed"
