#!/usr/bin/env bash
# Phase-23: create Library folders + secondary Policy top flag.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"

BRIDGE="$ROOT/webui/bin/fwbweb"
API_DIR="$ROOT/webui/backend"
FIX="$ROOT/webui/fixtures/sample-v24.fwb"
TOKEN="${FWBWEB_API_TOKEN:-dev-token}"
PORT="${FWBWEB_PORT:-18113}"
TMP="${TMPDIR:-/tmp}/fwbweb-e2e23-$$"
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

lib=post("/objects", {"parent_id": "root", "type": "Library", "name": "webui-e2e-lib"})
assert lib["type"]=="Library", lib
full=get(f"/objects/{lib['id']}")
kids=full.get("children") or []
names={c["name"] for c in kids}
print("library folders", sorted(names))
assert {"Objects","Services","Firewalls","Clusters","Time"} <= names, names

fw=[r for r in get("/search?q=&type=Firewall&limit=20")["results"]
    if not str(r["id"]).startswith("std")][0]["id"]
pol=post("/objects", {"parent_id": fw, "type": "Policy", "name": "webui-e2e-secpol"})
pattrs=(pol.get("attrs") or {})
print("secondary policy top", pattrs.get("top"))
assert str(pattrs.get("top")).lower() in ("false","0",""), pattrs
# can promote to top
promoted=patch(f"/objects/{pol['id']}", {"attrs": {"top": "True"}})
assert str((promoted.get("attrs") or {}).get("top")).lower() in ("true","1"), promoted

delete(f"/objects/{pol['id']}")
delete(f"/objects/{lib['id']}")
print("cleaned")
PY

curl -sf -o /dev/null -w "%{http_code}\n" "${auth[@]}" -X POST \
  "http://127.0.0.1:$PORT/api/v1/projects/$SID/close" | grep -q 204
echo "OK: phase23 e2e passed"
