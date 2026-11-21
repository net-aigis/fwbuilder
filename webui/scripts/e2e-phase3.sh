#!/usr/bin/env bash
# Phase-3 local E2E: add/move/delete rule, add ref via search, compile nft-test.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"

BRIDGE="$ROOT/webui/bin/fwbweb"
API_DIR="$ROOT/webui/backend"
FIX="$ROOT/webui/fixtures/sample-v24.fwb"
TOKEN="${FWBWEB_API_TOKEN:-dev-token}"
PORT="${FWBWEB_PORT:-18090}"
TMP="${TMPDIR:-/tmp}/fwbweb-e2e3-$$"
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

FW=$(python3 - <<PY
import json, urllib.request
req=urllib.request.Request(
  "http://127.0.0.1:$PORT/api/v1/projects/$SID/search?q=nft-test&type=Firewall",
  headers={"Authorization":"Bearer $TOKEN"})
d=json.load(urllib.request.urlopen(req))
assert d["count"]>=1, d
print(d["results"][0]["id"])
PY
)

echo "== baseline rules =="
curl -sf "${auth[@]}" \
  "http://127.0.0.1:$PORT/api/v1/projects/$SID/rulesets/$FW?which=policy" \
  >"$TMP/rules0.json"
BASE=$(python3 -c 'import json; print(len(json.load(open("'"$TMP"'/rules0.json"))["rules"]))')
echo "baseline=$BASE"

echo "== add rule =="
curl -sf "${auth[@]}" -d '{"which":"policy","where":"bottom"}' \
  "http://127.0.0.1:$PORT/api/v1/projects/$SID/rulesets/$FW/rules" \
  >"$TMP/add.json"
RID=$(python3 -c 'import json; print(json.load(open("'"$TMP"'/add.json"))["id"])')
POS=$(python3 -c 'import json; print(json.load(open("'"$TMP"'/add.json"))["position"])')
echo "added id=$RID pos=$POS"

echo "== move up =="
curl -sf "${auth[@]}" -d '{"direction":"up"}' \
  "http://127.0.0.1:$PORT/api/v1/projects/$SID/rules/$RID/move" \
  >"$TMP/move.json"
python3 - <<PY
import json
r=json.load(open("$TMP/move.json"))
print("pos after up", r["position"])
assert r["position"] < int("$POS") or int("$POS")==0
PY

echo "== add ref (AnyNetwork or Network) =="
OBJ=$(python3 - <<PY
import json, urllib.request
req=urllib.request.Request(
  "http://127.0.0.1:$PORT/api/v1/projects/$SID/search?q=&type=Network&limit=5",
  headers={"Authorization":"Bearer $TOKEN"})
d=json.load(urllib.request.urlopen(req))
assert d["count"]>=1, d
print(d["results"][0]["id"], d["results"][0]["name"])
open("$TMP/obj.id","w").write(d["results"][0]["id"])
PY
)
OID=$(cat "$TMP/obj.id")
curl -sf "${auth[@]}" -d "{\"element\":\"src\",\"object_id\":\"$OID\"}" \
  "http://127.0.0.1:$PORT/api/v1/projects/$SID/rules/$RID/refs" \
  >"$TMP/ref.json"
python3 - <<PY
import json
r=json.load(open("$TMP/ref.json"))
objs=r.get("src",{}).get("objects") or []
print("src objects", [o["name"] for o in objs])
assert any(o["id"]=="$OID" for o in objs), r
PY

echo "== delete rule =="
curl -sf "${auth[@]}" -X DELETE \
  "http://127.0.0.1:$PORT/api/v1/projects/$SID/rules/$RID" >/dev/null
curl -sf "${auth[@]}" \
  "http://127.0.0.1:$PORT/api/v1/projects/$SID/rulesets/$FW?which=policy" \
  >"$TMP/rules1.json"
python3 - <<PY
import json
n=len(json.load(open("$TMP/rules1.json"))["rules"])
print("count after delete", n)
assert n == int("$BASE"), (n, "$BASE")
PY

echo "== compile =="
HTTP=$(curl -s -o "$TMP/compile.json" -w "%{http_code}" "${auth[@]}" \
  -d "{\"firewall_id\":\"$FW\"}" \
  "http://127.0.0.1:$PORT/api/v1/projects/$SID/compile" || true)
echo "compile http=$HTTP"
python3 - <<PY
import json, sys
http=int("$HTTP")
d=json.load(open("$TMP/compile.json"))
print(json.dumps(d, indent=2)[:2000])
if http != 200:
    # Compiler binary may be missing until SKIP_COMPILERS=0 rebuild.
    detail=d.get("detail")
    msg=detail if isinstance(detail, str) else (detail or {}).get("message", str(d))
    if "compiler binary not found" in str(msg) or "not found" in str(msg):
        print("WARN: compile skipped — build compilers first")
        sys.exit(0)
    sys.exit(1)
assert d.get("ok"), d
assert d.get("compiler") == "fwb_nft", d
print("outputs", d.get("outputs"))
assert "nft-test.fw" in d.get("outputs", []), d
open("$TMP/out.name","w").write("nft-test.fw")
PY

echo "== download output =="
OUT=$(cat "$TMP/out.name")
curl -sf "${auth[@]}" \
  "http://127.0.0.1:$PORT/api/v1/projects/$SID/compile/outputs/$OUT" \
  >"$TMP/downloaded.fw"
python3 - <<PY
text=open("$TMP/downloaded.fw").read()
assert "nft" in text.lower() or "table" in text.lower() or len(text)>20, text[:200]
print("downloaded bytes", len(text))
PY

curl -sf "${auth[@]}" -d '{}' "http://127.0.0.1:$PORT/api/v1/projects/$SID/save" >/dev/null
curl -sf -o /dev/null -w "%{http_code}\n" "${auth[@]}" -X POST \
  "http://127.0.0.1:$PORT/api/v1/projects/$SID/close" | grep -q 204

echo "OK: phase3 e2e passed"
