#!/usr/bin/env bash
# Phase-22: Interface dyn/unnumbered/security_level + move rule to position.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"

BRIDGE="$ROOT/webui/bin/fwbweb"
API_DIR="$ROOT/webui/backend"
FIX="$ROOT/webui/fixtures/sample-v24.fwb"
TOKEN="${FWBWEB_API_TOKEN:-dev-token}"
PORT="${FWBWEB_PORT:-18112}"
TMP="${TMPDIR:-/tmp}/fwbweb-e2e22-$$"
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
import json, urllib.request
H={"Authorization":"Bearer $TOKEN","Content-Type":"application/json"}
base=f"http://127.0.0.1:$PORT/api/v1/projects/$SID"

def get(path):
    return json.load(urllib.request.urlopen(urllib.request.Request(base+path, headers=H)))

def post(path, body=None):
    data=b"{}" if body is None else json.dumps(body).encode()
    req=urllib.request.Request(base+path, data=data, method="POST", headers=H)
    return json.load(urllib.request.urlopen(req))

def patch(path, body):
    data=json.dumps(body).encode()
    req=urllib.request.Request(base+path, data=data, method="PATCH", headers=H)
    return json.load(urllib.request.urlopen(req))

def delete(path):
    req=urllib.request.Request(base+path, method="DELETE", headers=H)
    return json.load(urllib.request.urlopen(req))

fw=[r for r in get("/search?q=&type=Firewall&limit=20")["results"]
    if not str(r["id"]).startswith("std")][0]["id"]
iface=post("/objects", {"parent_id": fw, "type": "Interface", "name": "webui-e2e-dyn"})
patched=patch(f"/objects/{iface['id']}", {
  "attrs": {"dyn": "True", "unnumbered": "True", "security_level": 50, "label": "dyn-unnum"},
})
attrs=patched.get("attrs") or {}
print("iface", {k: attrs.get(k) for k in ("dyn","unnumbered","security_level","label")})
assert str(attrs.get("dyn")).lower() in ("true","1"), attrs
assert str(attrs.get("unnumbered")).lower() in ("true","1"), attrs
assert int(attrs.get("security_level"))==50, attrs

# move rule to absolute position
rules=get(f"/rulesets/$FW?which=policy")["rules"]
assert len(rules) >= 2, rules
bottom=post(f"/rulesets/$FW/rules", {"which": "policy", "where": "bottom"})
bid=bottom["id"]
print("added at bottom", bid, bottom.get("position"))
moved=post(f"/rules/{bid}/move", {"to": 0})
print("moved to", moved.get("position"))
assert int(moved.get("position"))==0, moved
rules2=sorted(get(f"/rulesets/$FW?which=policy")["rules"], key=lambda r: r["position"])
assert rules2[0]["id"]==bid, [r["id"] for r in rules2]

# group meta for filter coverage
patch(f"/rules/{bid}", {"group": "webui-e2e-grp"})
again=get(f"/rulesets/$FW?which=policy")["rules"]
g=next(r for r in again if r["id"]==bid)
assert g.get("group")=="webui-e2e-grp", g

delete(f"/rules/{bid}")
delete(f"/objects/{iface['id']}")
print("cleaned")
PY

curl -sf -o /dev/null -w "%{http_code}\n" "${auth[@]}" -X POST \
  "http://127.0.0.1:$PORT/api/v1/projects/$SID/close" | grep -q 204
echo "OK: phase22 e2e passed"
