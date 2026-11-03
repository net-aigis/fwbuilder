#!/usr/bin/env bash
# Phase-68: unused TSV with comment + deleted list export shape.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"

BRIDGE="$ROOT/webui/bin/fwbweb"
API_DIR="$ROOT/webui/backend"
FIX="$ROOT/webui/fixtures/sample-v24.fwb"
TOKEN="${FWBWEB_API_TOKEN:-dev-token}"
PORT="${FWBWEB_PORT:-18158}"
TMP="${TMPDIR:-/tmp}/fwbweb-e2e68-$$"
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
obj=call("POST","/objects",{"parent_id": nets, "type":"Network", "name":"webui-e2e-u68",
  "comment":"unused-cmt-68", "attrs":{"address":"10.68.1.0","netmask":"255.255.255.0"}})
unused=call("GET","/unused?limit=200")
row=next(o for o in (unused.get("objects") or []) if o["id"]==obj["id"])
assert row.get("comment")=="unused-cmt-68", row
utsv="id\ttype\tname\tcomment\n"+f"{row['id']}\t{row['type']}\t{row['name']}\t{row['comment']}"
assert "unused-cmt-68" in utsv
print("unused tsv ok")

call("DELETE", f"/objects/{obj['id']}?soft=true")
deleted=call("GET","/deleted")
drow=next(o for o in (deleted.get("objects") or []) if o["id"]==obj["id"])
payload={"count":1,"objects":[drow]}
assert "id" in drow and drow.get("type")=="Network"
print("deleted export keys", sorted(drow.keys())[:8])

call("DELETE", f"/objects/{obj['id']}?permanent=true")
print("cleaned")
PY

curl -sf -o /dev/null -w "%{http_code}\n" "${auth[@]}" -X POST \
  "http://127.0.0.1:$PORT/api/v1/projects/$SID/close" | grep -q 204
echo "OK: phase68 e2e passed"
