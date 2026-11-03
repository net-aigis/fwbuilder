#!/usr/bin/env bash
# Phase-65: search hit includes comment + bulk direction.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"

BRIDGE="$ROOT/webui/bin/fwbweb"
API_DIR="$ROOT/webui/backend"
FIX="$ROOT/webui/fixtures/sample-v24.fwb"
TOKEN="${FWBWEB_API_TOKEN:-dev-token}"
PORT="${FWBWEB_PORT:-18155}"
TMP="${TMPDIR:-/tmp}/fwbweb-e2e65-$$"
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
import json, urllib.request, urllib.error, urllib.parse
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
marker="webui-e2e-hint65"
obj=call("POST","/objects",{"parent_id": nets, "type":"Network", "name":"webui-e2e-n65",
  "comment": marker, "attrs":{"address":"10.65.1.0","netmask":"255.255.255.0"}})
hits=call("GET", f"/search?q={urllib.parse.quote(marker)}&limit=20")
row=next(h for h in hits.get("results") or [] if h["id"]==obj["id"])
assert row.get("comment")==marker, row
print("search comment field", row.get("comment"))
tsv="id\ttype\tname\tcomment\n"+f"{row['id']}\t{row['type']}\t{row['name']}\t{row['comment']}"
assert marker in tsv

rules=call("GET", f"/rulesets/{FW}?which=policy")["rules"]
assert rules
rid=rules[0]["id"]
call("PATCH", f"/rules/{rid}", {"direction":"Inbound"})
chk=call("GET", f"/rulesets/{FW}?which=policy")["rules"]
got=next(r for r in chk if r["id"]==rid)
assert got.get("direction")=="Inbound", got
print("direction Inbound")
call("PATCH", f"/rules/{rid}", {"direction":"Both"})

call("DELETE", f"/objects/{obj['id']}?permanent=true")
print("cleaned")
PY

curl -sf -o /dev/null -w "%{http_code}\n" "${auth[@]}" -X POST \
  "http://127.0.0.1:$PORT/api/v1/projects/$SID/close" | grep -q 204
echo "OK: phase65 e2e passed"
