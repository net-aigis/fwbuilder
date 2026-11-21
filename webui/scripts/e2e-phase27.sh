#!/usr/bin/env bash
# Phase-27: compile-all, Tag/User/Interval create, rule object-name filter (API).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"

BRIDGE="$ROOT/webui/bin/fwbweb"
API_DIR="$ROOT/webui/backend"
FIX="$ROOT/webui/fixtures/sample-v24.fwb"
TOKEN="${FWBWEB_API_TOKEN:-dev-token}"
PORT="${FWBWEB_PORT:-18117}"
TMP="${TMPDIR:-/tmp}/fwbweb-e2e27-$$"
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
FW="id2679X30989"

def call(method, path, body=None):
    data=None if body is None else json.dumps(body).encode()
    req=urllib.request.Request(base+path, data=data, method=method, headers=H)
    try:
        with urllib.request.urlopen(req) as resp:
            raw=resp.read()
            return json.loads(raw) if raw else {"_status": resp.status}
    except urllib.error.HTTPError as e:
        raise AssertionError(f"{method} {path} -> {e.code}: {e.read().decode()}") from e

svcs=[r for r in call("GET","/search?q=Services&type=ServiceGroup&limit=20")["results"]
      if r["name"]=="Services" and not str(r["id"]).startswith("std")][0]["id"]
times=[r for r in call("GET","/search?q=Time&type=IntervalGroup&limit=20")["results"]
       if r["name"]=="Time" and not str(r["id"]).startswith("std")][0]["id"]

tag=call("POST","/objects",{
  "parent_id": svcs, "type":"TagService", "name":"webui-e2e-tag27",
  "attrs":{"tagcode":"webui-tag-27"},
})
print("tag", tag.get("attrs"))
assert (tag.get("attrs") or {}).get("tagcode")=="webui-tag-27", tag

user=call("POST","/objects",{
  "parent_id": svcs, "type":"UserService", "name":"webui-e2e-user27",
  "attrs":{"userid":"bob"},
})
print("user", user.get("attrs"))
assert (user.get("attrs") or {}).get("userid")=="bob", user

iv=call("POST","/objects",{
  "parent_id": times, "type":"Interval", "name":"webui-e2e-iv27",
  "attrs":{"from_hour":8,"from_minute":30,"to_hour":18,"to_minute":0,"days_of_week":"1,2,3,4,5"},
})
a=iv.get("attrs") or {}
print("interval", a)
assert int(a.get("from_hour"))==8, a
assert int(a.get("from_minute"))==30, a
assert a.get("days_of_week")=="1,2,3,4,5", a

# compile-all
comp=call("POST","/compile-all", {"continue_on_error": True})
print("compile-all", comp.get("count"), "ok", comp.get("succeeded"), "fail", comp.get("failed"))
assert comp.get("count", 0) >= 1, comp
assert comp.get("succeeded", 0) >= 1, comp
assert any(r.get("ok") for r in comp.get("results") or []), comp

# rule object filter evidence: at least one policy rule has named objects
rules=call("GET", f"/rulesets/{FW}?which=policy")["rules"]
named=False
for r in rules:
    for key,val in r.items():
        if isinstance(val, dict) and val.get("objects"):
            for o in val["objects"]:
                if o.get("name") and o["name"]!="Any":
                    named=True
                    print("sample object in rule", o["name"], "rule", r.get("position"))
                    break
        if named: break
    if named: break
assert named, "expected named objects in policy for UI filter"

call("DELETE", f"/objects/{tag['id']}")
call("DELETE", f"/objects/{user['id']}")
call("DELETE", f"/objects/{iv['id']}")
print("cleaned")
PY

curl -sf -o /dev/null -w "%{http_code}\n" "${auth[@]}" -X POST \
  "http://127.0.0.1:$PORT/api/v1/projects/$SID/close" | grep -q 204
echo "OK: phase27 e2e passed"
