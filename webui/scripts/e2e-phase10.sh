#!/usr/bin/env bash
# Phase-10: where-used references.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"

BRIDGE="$ROOT/webui/bin/fwbweb"
API_DIR="$ROOT/webui/backend"
FIX="$ROOT/webui/fixtures/sample-v24.fwb"
TOKEN="${FWBWEB_API_TOKEN:-dev-token}"
PORT="${FWBWEB_PORT:-18098}"
TMP="${TMPDIR:-/tmp}/fwbweb-e2e10-$$"
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

echo "== pick referenced object =="
# Any object that appears in a policy rule cell should have uses.
OID=$(python3 - <<PY
import json, urllib.request
H={"Authorization":"Bearer $TOKEN"}
# Prefer a well-known network from the fixture if present
req=urllib.request.Request(
  f"http://127.0.0.1:$PORT/api/v1/projects/$SID/search?q=&type=Network&limit=30",
  headers=H)
d=json.load(urllib.request.urlopen(req))
assert d["count"]>=1, d
# Probe where-used until we find one with references
for r in d["results"]:
    req=urllib.request.Request(
      f"http://127.0.0.1:$PORT/api/v1/projects/$SID/objects/{r['id']}/where-used",
      headers=H)
    w=json.load(urllib.request.urlopen(req))
    if (w.get("count") or 0) > 0:
        print(r["id"]); break
else:
    # Fall back to first network (count may be 0 for unused)
    print(d["results"][0]["id"])
PY
)
echo "object=$OID"
curl -sf "${auth[@]}" \
  "http://127.0.0.1:$PORT/api/v1/projects/$SID/objects/$OID/where-used" >"$TMP/wu.json"
python3 - <<PY
import json
d=json.load(open("$TMP/wu.json"))
print("where-used count", d.get("count"), "sample", (d.get("uses") or [])[:3])
assert "uses" in d and "count" in d, d
assert d["object_id"]=="$OID", d
PY

curl -sf -o /dev/null -w "%{http_code}\n" "${auth[@]}" -X POST \
  "http://127.0.0.1:$PORT/api/v1/projects/$SID/close" | grep -q 204
echo "OK: phase10 e2e passed"
