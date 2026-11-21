#!/usr/bin/env bash
# Local E2E without GitHub Actions: bridge wrapper + API open/tree/update/save.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"

BRIDGE="$ROOT/webui/bin/fwbweb"
API_DIR="$ROOT/webui/backend"
FIX="$ROOT/webui/fixtures/sample-v24.fwb"
TOKEN="${FWBWEB_API_TOKEN:-dev-token}"
PORT="${FWBWEB_PORT:-18088}"
TMP="${TMPDIR:-/tmp}/fwbweb-e2e-$$"
mkdir -p "$TMP"

chmod +x "$BRIDGE"
test -x "$ROOT/src/fwbweb/fwbweb"
test -f "$FIX"

export FWBWEB_BRIDGE="$BRIDGE"
export FWBWEB_API_TOKEN="$TOKEN"
export FWBWEB_WORKSPACE="$ROOT/webui/.workspace"
export FWBUILDER_RES_DIR="$ROOT/webui/.res"

mkdir -p "$FWBWEB_WORKSPACE"

# shellcheck disable=SC1091
source "$API_DIR/.venv/bin/activate"
cd "$API_DIR"

uvicorn fwbweb_api.main:app --host 127.0.0.1 --port "$PORT" >"$TMP/api.log" 2>&1 &
API_PID=$!
cleanup() { kill "$API_PID" 2>/dev/null || true; rm -rf "$TMP"; }
trap cleanup EXIT

for _ in $(seq 1 50); do
  if curl -sf "http://127.0.0.1:$PORT/api/v1/health" >/dev/null; then
    break
  fi
  sleep 0.2
done

auth=(-H "Authorization: Bearer $TOKEN" -H "Content-Type: application/json")

echo "== open =="
curl -sf "${auth[@]}" -d "{\"path\":\"$FIX\",\"copy_to_workspace\":true}" \
  "http://127.0.0.1:$PORT/api/v1/projects/open" | tee "$TMP/open.json" | python3 -m json.tool
SID=$(python3 -c 'import json; print(json.load(open("'"$TMP"'/open.json"))["session_id"])')

echo "== tree =="
curl -sf "${auth[@]}" "http://127.0.0.1:$PORT/api/v1/projects/$SID/tree?depth=2" \
  >"$TMP/tree.json"
python3 - <<PY
import json
t=json.load(open("$TMP/tree.json"))
root=t["root"]
print("root", root["name"], "libraries", root.get("children_count"))
for c in root.get("children") or []:
    print(" -", c["type"], c["name"], c["id"])
PY

USER_LIB=$(python3 - <<PY
import json
t=json.load(open("$TMP/tree.json"))
for c in t["root"].get("children") or []:
    if c.get("name")=="User":
        print(c["id"]); break
else:
    raise SystemExit("User library not found")
PY
)

echo "== update User library comment =="
curl -sf "${auth[@]}" -X PATCH \
  -d '{"comment":"webui-e2e-comment"}' \
  "http://127.0.0.1:$PORT/api/v1/projects/$SID/objects/$USER_LIB" \
  | tee "$TMP/upd.json" | python3 -m json.tool | head -30

python3 - <<PY
import json
o=json.load(open("$TMP/upd.json"))
assert o.get("comment")=="webui-e2e-comment", o
print("comment ok")
PY

echo "== save =="
curl -sf "${auth[@]}" -d '{}' "http://127.0.0.1:$PORT/api/v1/projects/$SID/save" | python3 -m json.tool

echo "== close =="
code=$(curl -sf -o /dev/null -w "%{http_code}" "${auth[@]}" -X POST \
  "http://127.0.0.1:$PORT/api/v1/projects/$SID/close")
test "$code" = "204"

echo "OK: local e2e passed"
