#!/usr/bin/env bash
# Phase-28: CustomService/IPService create + compile outputs zip.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"

BRIDGE="$ROOT/webui/bin/fwbweb"
API_DIR="$ROOT/webui/backend"
FIX="$ROOT/webui/fixtures/sample-v24.fwb"
TOKEN="${FWBWEB_API_TOKEN:-dev-token}"
PORT="${FWBWEB_PORT:-18118}"
TMP="${TMPDIR:-/tmp}/fwbweb-e2e28-$$"
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
import json, urllib.request, urllib.error, zipfile, io
H={"Authorization":"Bearer $TOKEN","Content-Type":"application/json"}
base=f"http://127.0.0.1:$PORT/api/v1/projects/$SID"
FW="$FW"

def call(method, path, body=None, raw=False):
    data=None if body is None else json.dumps(body).encode()
    req=urllib.request.Request(base+path, data=data, method=method, headers=H)
    try:
        with urllib.request.urlopen(req) as resp:
            rawb=resp.read()
            if raw:
                return rawb, resp.headers
            return json.loads(rawb) if rawb else {"_status": resp.status}
    except urllib.error.HTTPError as e:
        raise AssertionError(f"{method} {path} -> {e.code}: {e.read().decode()}") from e

svcs=[r for r in call("GET","/search?q=Services&type=ServiceGroup&limit=20")["results"]
      if r["name"]=="Services" and not str(r["id"]).startswith("std")][0]["id"]

ip=call("POST","/objects",{
  "parent_id": svcs, "type":"IPService", "name":"webui-e2e-gre",
  "attrs":{"protocol_num": 47},
})
print("ipservice", ip.get("attrs"))
assert int((ip.get("attrs") or {}).get("protocol_num"))==47, ip

cust=call("POST","/objects",{
  "parent_id": svcs, "type":"CustomService", "name":"webui-e2e-cust28",
  "attrs":{"protocol":"tcp","address_family":"inet","code":"accept"},
})
ca=cust.get("attrs") or {}
print("custom", ca)
assert ca.get("protocol")=="tcp", ca
assert ca.get("address_family")=="inet", ca

# compile one fw then download zip
comp=call("POST","/compile", {"firewall_id": FW})
assert comp.get("outputs"), comp
print("compiled", comp.get("firewall"), comp.get("outputs"))
raw, hdrs = call("GET","/compile/zip", raw=True)
assert raw[:2]==b"PK", raw[:20]
zf=zipfile.ZipFile(io.BytesIO(raw))
names=zf.namelist()
print("zip names", names, "ctype", hdrs.get("Content-Type"))
assert names, names
assert set(names) >= set(comp.get("outputs") or []) or all(
  any(n.endswith(o) or n==o for n in names) for o in (comp.get("outputs") or [])
), (names, comp.get("outputs"))

# search type filter
hits=call("GET","/search?q=webui-e2e-gre&type=IPService&limit=20")["results"]
assert any(h["id"]==ip["id"] for h in hits), hits

call("DELETE", f"/objects/{ip['id']}")
call("DELETE", f"/objects/{cust['id']}")
print("cleaned")
PY

curl -sf -o /dev/null -w "%{http_code}\n" "${auth[@]}" -X POST \
  "http://127.0.0.1:$PORT/api/v1/projects/$SID/close" | grep -q 204
echo "OK: phase28 e2e passed"
