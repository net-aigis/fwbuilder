#!/usr/bin/env bash
# Phase-47: create Cluster under User Clusters folder.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"

BRIDGE="$ROOT/webui/bin/fwbweb"
API_DIR="$ROOT/webui/backend"
FIX="$ROOT/webui/fixtures/sample-v24.fwb"
TOKEN="${FWBWEB_API_TOKEN:-dev-token}"
PORT="${FWBWEB_PORT:-18137}"
TMP="${TMPDIR:-/tmp}/fwbweb-e2e47-$$"
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

parent=[r for r in call("GET","/search?q=Clusters&type=ObjectGroup&limit=20")["results"]
        if r["name"]=="Clusters" and not str(r["id"]).startswith("std")][0]["id"]
cl=call("POST","/objects",{
  "parent_id": parent, "type":"Cluster", "name":"webui-e2e-cluster47",
  "attrs":{"platform":"nftables","host_OS":"linux24"},
})
print("cluster", cl.get("id"), cl.get("type"), (cl.get("attrs") or {}).get("platform"))
assert cl.get("type")=="Cluster"
assert (cl.get("attrs") or {}).get("platform")=="nftables"
rs=cl.get("rulesets") or {}
assert rs.get("policy") and rs.get("nat") and rs.get("routing"), rs
rslist=cl.get("ruleset_list") or []
assert any(r.get("type")=="Policy" for r in rslist)
hits=call("GET","/search?q=webui-e2e-cluster47&type=Cluster&limit=10")
assert any(r["id"]==cl["id"] for r in hits.get("results") or [])
stats=call("GET","/stats")
assert stats.get("clusters",0) >= 1
call("DELETE", f"/objects/{cl['id']}?permanent=true")
print("cleaned")
PY

curl -sf -o /dev/null -w "%{http_code}\n" "${auth[@]}" -X POST \
  "http://127.0.0.1:$PORT/api/v1/projects/$SID/close" | grep -q 204
echo "OK: phase47 e2e passed"
