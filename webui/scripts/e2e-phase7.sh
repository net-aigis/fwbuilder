#!/usr/bin/env bash
# Phase-7: create/delete objects + interface options.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"

BRIDGE="$ROOT/webui/bin/fwbweb"
API_DIR="$ROOT/webui/backend"
FIX="$ROOT/webui/fixtures/sample-v24.fwb"
TOKEN="${FWBWEB_API_TOKEN:-dev-token}"
PORT="${FWBWEB_PORT:-18095}"
TMP="${TMPDIR:-/tmp}/fwbweb-e2e7-$$"
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

echo "== find ObjectGroup parent =="
PARENT=$(python3 - <<PY
import json, urllib.request
# Prefer User library Networks (not Standard — those inherit read-only).
req=urllib.request.Request(
  "http://127.0.0.1:$PORT/api/v1/projects/$SID/search?q=Networks&type=ObjectGroup&limit=20",
  headers={"Authorization":"Bearer $TOKEN"})
d=json.load(urllib.request.urlopen(req))
cands=[r for r in d["results"] if r["name"]=="Networks" and not str(r["id"]).startswith("std")]
assert cands, d
# Verify writable via get
oid=cands[0]["id"]
req=urllib.request.Request(
  f"http://127.0.0.1:$PORT/api/v1/projects/$SID/objects/{oid}",
  headers={"Authorization":"Bearer $TOKEN"})
obj=json.load(urllib.request.urlopen(req))
assert not obj.get("ro"), obj
print(oid)
PY
)
echo "parent=$PARENT"

echo "== create Network =="
curl -sf "${auth[@]}" -d "{\"parent_id\":\"$PARENT\",\"type\":\"Network\",\"name\":\"webui-e2e-net\",\"attrs\":{\"address\":\"10.66.66.0\",\"netmask\":\"255.255.255.0\"}}" \
  "http://127.0.0.1:$PORT/api/v1/projects/$SID/objects" >"$TMP/created.json"
OID=$(python3 - <<PY
import json
o=json.load(open("$TMP/created.json"))
assert o["type"]=="Network", o
assert o["name"]=="webui-e2e-net", o
assert o.get("attrs",{}).get("address")=="10.66.66.0", o
print(o["id"])
PY
)
echo "created=$OID"

echo "== delete Network =="
curl -sf "${auth[@]}" -X DELETE \
  "http://127.0.0.1:$PORT/api/v1/projects/$SID/objects/$OID" >"$TMP/del.json"
python3 - <<PY
import json, urllib.request
req=urllib.request.Request(
  "http://127.0.0.1:$PORT/api/v1/projects/$SID/search?q=webui-e2e-net&type=Network",
  headers={"Authorization":"Bearer $TOKEN"})
d=json.load(urllib.request.urlopen(req))
assert d["count"]==0, d
print("deleted ok")
PY

echo "== interface options =="
IFACE=$(python3 - <<PY
import json, urllib.request
req=urllib.request.Request(
  "http://127.0.0.1:$PORT/api/v1/projects/$SID/search?q=&type=Interface&limit=40",
  headers={"Authorization":"Bearer $TOKEN"})
d=json.load(urllib.request.urlopen(req))
assert d["count"]>=1, d
chosen=None
for r in d["results"]:
    if r["name"] in ("Dummy",) or str(r["id"]).startswith("dummy"):
        continue
    req=urllib.request.Request(
      f"http://127.0.0.1:$PORT/api/v1/projects/$SID/objects/{r['id']}/options",
      headers={"Authorization":"Bearer $TOKEN"})
    o=json.load(urllib.request.urlopen(req))
    if (o.get("host_OS") or "").strip():
        chosen=r["id"]; break
assert chosen, d
print(chosen)
PY
)
curl -sf "${auth[@]}" \
  "http://127.0.0.1:$PORT/api/v1/projects/$SID/objects/$IFACE/options" >"$TMP/iopts.json"
python3 - <<PY
import json, urllib.request
d=json.load(open("$TMP/iopts.json"))
assert "options" in d
host_os=(d.get("host_OS") or "").strip()
print("iface stored keys", len(d.get("options") or {}), "host_OS", host_os or "?")
assert host_os, d
req=urllib.request.Request(
  f"http://127.0.0.1:$PORT/api/v1/interface-option-schema?host_os={host_os}",
  headers={"Authorization":"Bearer $TOKEN"})
schema=json.load(urllib.request.urlopen(req))
print("iface schema keys", len(schema.get("featured_keys") or []),
      "dialog", schema.get("interface_dialog"),
      "stem", schema.get("dialog_stem"))
assert schema.get("featured_keys") or schema.get("defaults"), schema
# Patch one known key when present
keys=list(schema.get("featured_keys") or [])
if keys:
    key=keys[0]
    patch={key: (d.get("options") or {}).get(key) or schema.get("defaults",{}).get(key,"") or "0"}
    body=json.dumps({"options": patch}).encode()
    req=urllib.request.Request(
      f"http://127.0.0.1:$PORT/api/v1/projects/$SID/objects/$IFACE/options",
      data=body, method="PATCH",
      headers={"Authorization":"Bearer $TOKEN","Content-Type":"application/json"})
    out=json.load(urllib.request.urlopen(req))
    assert key in (out.get("options") or {}), out
    print("iface patch ok", key)
PY

curl -sf -o /dev/null -w "%{http_code}\n" "${auth[@]}" -X POST \
  "http://127.0.0.1:$PORT/api/v1/projects/$SID/close" | grep -q 204
echo "OK: phase7 e2e passed"
