#!/usr/bin/env bash
# Phase-56: duplicate Policy ruleset + where-used JSON shape.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"

BRIDGE="$ROOT/webui/bin/fwbweb"
API_DIR="$ROOT/webui/backend"
FIX="$ROOT/webui/fixtures/sample-v24.fwb"
TOKEN="${FWBWEB_API_TOKEN:-dev-token}"
PORT="${FWBWEB_PORT:-18146}"
TMP="${TMPDIR:-/tmp}/fwbweb-e2e56-$$"
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

src_rules=call("GET", f"/rulesets/{FW}?which=policy")["rules"]
assert src_rules
src_sorted=sorted(src_rules, key=lambda r: r.get("position", 0))
print("src rules", len(src_sorted))

dup=call("POST","/objects",{"parent_id": FW, "type":"Policy", "name":"webui-e2e-pol56"})
print("dup policy", dup.get("id"), (dup.get("attrs") or {}).get("top"))
assert str((dup.get("attrs") or {}).get("top")).lower() in ("false","0","")

for r in src_sorted:
    call("POST", f"/rules/{r['id']}/duplicate", {"ruleset_id": dup["id"]})

copied=call("GET", f"/rulesets/{dup['id']}?which=policy")["rules"]
print("copied", len(copied))
assert len(copied)==len(src_sorted)

# where-used JSON shape
iface=call("GET","/search?q=eth0&type=Interface&limit=5")["results"][0]
wu=call("GET", f"/objects/{iface['id']}/where-used")
payload={"object_id": iface["id"], "count": wu.get("count"), "uses": wu.get("uses")}
assert isinstance(payload["uses"], list)
print("where-used", payload["count"], "keys", list(payload["uses"][0].keys()) if payload["uses"] else [])

call("DELETE", f"/objects/{dup['id']}?permanent=true")
print("cleaned")
PY

curl -sf -o /dev/null -w "%{http_code}\n" "${auth[@]}" -X POST \
  "http://127.0.0.1:$PORT/api/v1/projects/$SID/close" | grep -q 204
echo "OK: phase56 e2e passed"
