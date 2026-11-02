#!/usr/bin/env bash
# Phase-35: bulk rule group + object duplicate (Ctrl+D object tab).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"

BRIDGE="$ROOT/webui/bin/fwbweb"
API_DIR="$ROOT/webui/backend"
FIX="$ROOT/webui/fixtures/sample-v24.fwb"
TOKEN="${FWBWEB_API_TOKEN:-dev-token}"
PORT="${FWBWEB_PORT:-18125}"
TMP="${TMPDIR:-/tmp}/fwbweb-e2e35-$$"
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

svcs=[r for r in call("GET","/search?q=Services&type=ServiceGroup&limit=20")["results"]
      if r["name"]=="Services" and not str(r["id"]).startswith("std")][0]["id"]

tcp=call("POST","/objects",{
  "parent_id": svcs, "type":"TCPService", "name":"webui-e2e-tcp35",
  "attrs":{
    "src_range_start":"1024","src_range_end":"2048",
    "dst_range_start":"443","dst_range_end":"443",
  },
})
a=tcp.get("attrs") or {}
print("tcp", a)
assert str(a.get("src_range_start"))=="1024", a
assert str(a.get("dst_range_start"))=="443", a

# duplicate object (Ctrl+D on object tab)
dup=call("POST", f"/objects/{tcp['id']}/duplicate", {})
print("dup", dup.get("name"), dup.get("id"))
assert dup.get("id") and dup["id"]!=tcp["id"]

rules=call("GET", f"/rulesets/{FW}?which=policy")["rules"]
assert len(rules)>=2, len(rules)
r0, r1 = rules[0], rules[1]
old0, old1 = r0.get("group") or "", r1.get("group") or ""
call("PATCH", f"/rules/{r0['id']}", {"group": "webui-e2e-grp35"})
call("PATCH", f"/rules/{r1['id']}", {"group": "webui-e2e-grp35"})
chk=call("GET", f"/rulesets/{FW}?which=policy")["rules"]
by={r["id"]: r for r in chk}
print("groups", by[r0["id"]].get("group"), by[r1["id"]].get("group"))
assert by[r0["id"]].get("group")=="webui-e2e-grp35"
assert by[r1["id"]].get("group")=="webui-e2e-grp35"
call("PATCH", f"/rules/{r0['id']}", {"group": old0})
call("PATCH", f"/rules/{r1['id']}", {"group": old1})

call("DELETE", f"/objects/{dup['id']}")
call("DELETE", f"/objects/{tcp['id']}")
print("cleaned")
PY

curl -sf -o /dev/null -w "%{http_code}\n" "${auth[@]}" -X POST \
  "http://127.0.0.1:$PORT/api/v1/projects/$SID/close" | grep -q 204
echo "OK: phase35 e2e passed"
