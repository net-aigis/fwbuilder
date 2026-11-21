#!/usr/bin/env bash
# Phase-21: search type filter + lazy object children.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"

BRIDGE="$ROOT/webui/bin/fwbweb"
API_DIR="$ROOT/webui/backend"
FIX="$ROOT/webui/fixtures/sample-v24.fwb"
TOKEN="${FWBWEB_API_TOKEN:-dev-token}"
PORT="${FWBWEB_PORT:-18111}"
TMP="${TMPDIR:-/tmp}/fwbweb-e2e21-$$"
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

# type-filtered search
nets=get("/search?q=&type=Network&limit=50")
print("network hits", nets["count"])
assert nets["count"] >= 1, nets
assert all(r["type"]=="Network" for r in nets["results"]), nets["results"][:3]

fws=get("/search?q=&type=Firewall&limit=20")
assert fws["count"] >= 1, fws
assert all(r["type"]=="Firewall" for r in fws["results"]), fws

# shallow tree then lazy-load children via get
tree=get("/tree?depth=1")
root=tree["root"]
libs=root.get("children") or []
user=next(c for c in libs if c.get("name")=="User")
print("user children in depth1", len(user.get("children") or []), "count", user.get("children_count"))
# User at depth1 may have children if depth counts from root... depth=1 means root+1 level
# so libraries have no nested children loaded
assert not (user.get("children") or []), user
assert (user.get("children_count") or 0) > 0, user

full=get(f"/objects/{user['id']}")
kids=full.get("children") or []
print("lazy user children", len(kids), [c.get("name") for c in kids[:5]])
assert len(kids) > 0, full
names={c["name"] for c in kids}
assert "Objects" in names or "Firewalls" in names or "Services" in names, names
print("ok")
PY

curl -sf -o /dev/null -w "%{http_code}\n" "${auth[@]}" -X POST \
  "http://127.0.0.1:$PORT/api/v1/projects/$SID/close" | grep -q 204
echo "OK: phase21 e2e passed"
