#!/usr/bin/env bash
# Phase-43: firewall list for stats + rename via PATCH name.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"

BRIDGE="$ROOT/webui/bin/fwbweb"
API_DIR="$ROOT/webui/backend"
FIX="$ROOT/webui/fixtures/sample-v24.fwb"
TOKEN="${FWBWEB_API_TOKEN:-dev-token}"
PORT="${FWBWEB_PORT:-18133}"
TMP="${TMPDIR:-/tmp}/fwbweb-e2e43-$$"
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

stats=call("GET","/stats")
fws=call("GET","/search?q=&type=Firewall&limit=50")
user_fws=[r for r in fws.get("results") or [] if not str(r["id"]).startswith("std")]
print("stats firewalls", stats.get("firewalls"), "search", len(user_fws))
assert stats.get("firewalls",0) >= 1
assert len(user_fws) >= 1
assert stats["firewalls"] == len(user_fws)

nets=[r for r in call("GET","/search?q=Networks&type=ObjectGroup&limit=20")["results"]
      if r["name"]=="Networks" and not str(r["id"]).startswith("std")][0]["id"]
obj=call("POST","/objects",{
  "parent_id": nets, "type":"Network", "name":"webui-e2e-ren43",
  "attrs":{"address":"10.43.0.0","netmask":"255.255.255.0"},
})
ren=call("PATCH", f"/objects/{obj['id']}", {"name":"webui-e2e-ren43-b"})
print("renamed", ren.get("name"))
assert ren.get("name")=="webui-e2e-ren43-b"
# stats JSON payload shape for Download JSON
payload={**stats, "firewalls_list":[{"id":f["id"],"name":f["name"],"type":f["type"]} for f in user_fws]}
assert "firewalls_list" in payload and payload["firewalls_list"]
call("DELETE", f"/objects/{obj['id']}?permanent=true")
print("cleaned")
PY

curl -sf -o /dev/null -w "%{http_code}\n" "${auth[@]}" -X POST \
  "http://127.0.0.1:$PORT/api/v1/projects/$SID/close" | grep -q 204
echo "OK: phase43 e2e passed"
