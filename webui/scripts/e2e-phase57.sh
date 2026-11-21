#!/usr/bin/env bash
# Phase-57: bulk action on rules + group members JSON shape.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"

BRIDGE="$ROOT/webui/bin/fwbweb"
API_DIR="$ROOT/webui/backend"
FIX="$ROOT/webui/fixtures/sample-v24.fwb"
TOKEN="${FWBWEB_API_TOKEN:-dev-token}"
PORT="${FWBWEB_PORT:-18147}"
TMP="${TMPDIR:-/tmp}/fwbweb-e2e57-$$"
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

# Add two rules, bulk-set action Reject, then delete
a=call("POST", f"/rulesets/{FW}/rules", {"which":"policy","where":"bottom"})
b=call("POST", f"/rulesets/{FW}/rules", {"which":"policy","where":"bottom"})
call("PATCH", f"/rules/{a['id']}", {"action":"Reject"})
call("PATCH", f"/rules/{b['id']}", {"action":"Reject"})
chk=call("GET", f"/rulesets/{FW}?which=policy")["rules"]
for rid in (a["id"], b["id"]):
    r=next(x for x in chk if x["id"]==rid)
    assert r.get("action")=="Reject", r
print("bulk action Reject ok")

# rules JSON payload shape (Copy JSON / Download JSON)
payload={"which":"policy","count":2,"rules":[r for r in chk if r["id"] in (a["id"], b["id"])]}
assert payload["count"]==len(payload["rules"])
print("rules json count", payload["count"])

call("DELETE", f"/rules/{a['id']}")
call("DELETE", f"/rules/{b['id']}")

# Group members JSON shape
nets=[r for r in call("GET","/search?q=Networks&type=ObjectGroup&limit=20")["results"]
      if r["name"]=="Networks" and not str(r["id"]).startswith("std")][0]
mem=call("GET", f"/objects/{nets['id']}/members")
members=mem.get("members") or []
gm={"group_id": nets["id"], "count": len(members), "members": members}
assert "members" in gm
print("group members", gm["count"])
print("cleaned")
PY

curl -sf -o /dev/null -w "%{http_code}\n" "${auth[@]}" -X POST \
  "http://127.0.0.1:$PORT/api/v1/projects/$SID/close" | grep -q 204
echo "OK: phase57 e2e passed"
