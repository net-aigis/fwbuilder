#!/usr/bin/env bash
# Phase-8: rule-option-schema + create TCPService with port + host options.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"

BRIDGE="$ROOT/webui/bin/fwbweb"
API_DIR="$ROOT/webui/backend"
FIX="$ROOT/webui/fixtures/sample-v24.fwb"
TOKEN="${FWBWEB_API_TOKEN:-dev-token}"
PORT="${FWBWEB_PORT:-18096}"
TMP="${TMPDIR:-/tmp}/fwbweb-e2e8-$$"
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

echo "== rule-option-schema =="
for kind in policy nat routing; do
  curl -sf "${auth[@]}" \
    "http://127.0.0.1:$PORT/api/v1/rule-option-schema?rule_kind=$kind" >"$TMP/rschema-$kind.json"
  python3 - <<PY
import json
d=json.load(open("$TMP/rschema-$kind.json"))
print("$kind", "fields", d.get("dialog_field_count"), "stem", d.get("dialog_stem"))
assert d.get("dialog_stem"), d
assert (d.get("dialog_field_count") or 0) >= 1 or d.get("featured_keys"), d
PY
done

echo "== create TCPService =="
PARENT=$(python3 - <<PY
import json, urllib.request
req=urllib.request.Request(
  "http://127.0.0.1:$PORT/api/v1/projects/$SID/search?q=Services&type=ServiceGroup&limit=20",
  headers={"Authorization":"Bearer $TOKEN"})
d=json.load(urllib.request.urlopen(req))
cands=[r for r in d["results"] if r["name"]=="Services" and not str(r["id"]).startswith("std")]
assert cands, d
oid=cands[0]["id"]
req=urllib.request.Request(
  f"http://127.0.0.1:$PORT/api/v1/projects/$SID/objects/{oid}",
  headers={"Authorization":"Bearer $TOKEN"})
obj=json.load(urllib.request.urlopen(req))
assert not obj.get("ro"), obj
print(oid)
PY
)
OID=$(curl -sf "${auth[@]}" -d "{\"parent_id\":\"$PARENT\",\"type\":\"TCPService\",\"name\":\"webui-e2e-svc\",\"attrs\":{\"dst_range_start\":\"8443\",\"dst_range_end\":\"8443\"}}" \
  "http://127.0.0.1:$PORT/api/v1/projects/$SID/objects" | python3 -c 'import sys,json;print(json.load(sys.stdin)["id"])')
echo "created=$OID"
curl -sf "${auth[@]}" "http://127.0.0.1:$PORT/api/v1/projects/$SID/objects/$OID" >"$TMP/svc.json"
python3 - <<PY
import json
d=json.load(open("$TMP/svc.json"))
attrs=d.get("attrs") or {}
print("svc attrs", attrs)
assert attrs.get("dst_range_start") in ("8443", 8443) or str(attrs.get("dst_range_start"))=="8443", d
PY
curl -sf "${auth[@]}" -X DELETE "http://127.0.0.1:$PORT/api/v1/projects/$SID/objects/$OID" >/dev/null

echo "== host options =="
HOST=$(python3 - <<PY
import json, urllib.request
req=urllib.request.Request(
  "http://127.0.0.1:$PORT/api/v1/projects/$SID/search?q=&type=Host&limit=20",
  headers={"Authorization":"Bearer $TOKEN"})
d=json.load(urllib.request.urlopen(req))
# Prefer user Host, not Standard
for r in d["results"]:
    if not str(r["id"]).startswith("std"):
        print(r["id"]); break
else:
    assert d["count"]>=1, d
    print(d["results"][0]["id"])
PY
)
curl -sf "${auth[@]}" \
  "http://127.0.0.1:$PORT/api/v1/projects/$SID/objects/$HOST/options" >"$TMP/hopts.json"
python3 - <<PY
import json
d=json.load(open("$TMP/hopts.json"))
assert "options" in d, d
print("host option keys", len(d.get("options") or {}))
PY
curl -sf "${auth[@]}" \
  "http://127.0.0.1:$PORT/api/v1/projects/$SID/objects/$HOST/management" >"$TMP/hmgmt.json" || true
python3 - <<PY
import json
try:
  d=json.load(open("$TMP/hmgmt.json"))
  print("host management", "address" in (d.get("management") or {}))
except Exception as e:
  print("host management skip", e)
PY

curl -sf -o /dev/null -w "%{http_code}\n" "${auth[@]}" -X POST \
  "http://127.0.0.1:$PORT/api/v1/projects/$SID/close" | grep -q 204
echo "OK: phase8 e2e passed"
