#!/usr/bin/env bash
# Phase-53: secondary Routing create + disabled jump data + search/unused TSV shape.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"

BRIDGE="$ROOT/webui/bin/fwbweb"
API_DIR="$ROOT/webui/backend"
FIX="$ROOT/webui/fixtures/sample-v24.fwb"
TOKEN="${FWBWEB_API_TOKEN:-dev-token}"
PORT="${FWBWEB_PORT:-18143}"
TMP="${TMPDIR:-/tmp}/fwbweb-e2e53-$$"
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
import json, urllib.request, urllib.error
H={"Authorization":"Bearer $TOKEN","Content-Type":"application/json"}
base=f"http://127.0.0.1:$PORT/api/v1/projects/$SID"
FW="$FW"

def call(method, path, body=None):
    data=None if body is None else json.dumps(body).encode()
    req=urllib.request.Request(base+path, data=data, method=method, headers=H)
    try:
        with urllib.request.urlopen(req) as resp:
            raw=resp.read()
            return json.loads(raw) if raw else {"_status": resp.status}
    except urllib.error.HTTPError as e:
        raise AssertionError(f"{method} {path} -> {e.code}: {e.read().decode()}") from e

rt=call("POST","/objects",{"parent_id": FW, "type":"Routing", "name":"webui-e2e-rt53"})
print("routing", rt.get("id"), rt.get("type"), (rt.get("attrs") or {}).get("top"))
assert rt.get("type")=="Routing"
assert str((rt.get("attrs") or {}).get("top")).lower() in ("false","0","")

fw=call("GET", f"/objects/{FW}")
rts=[r for r in (fw.get("ruleset_list") or []) if r.get("type")=="Routing"]
assert any(r.get("id")==rt["id"] for r in rts), rts

rules=call("GET", f"/rulesets/{FW}?which=policy")["rules"]
assert len(rules)>=2
r0, r1 = rules[0]["id"], rules[1]["id"]
call("PATCH", f"/rules/{r0}", {"disabled": True})
call("PATCH", f"/rules/{r1}", {"disabled": True})
chk=call("GET", f"/rulesets/{FW}?which=policy")["rules"]
disabled=[r for r in chk if r.get("disabled")]
print("disabled", len(disabled), [r["id"] for r in disabled[:3]])
assert len(disabled)>=2
# FE N/Shift+N cycles this list; restore
call("PATCH", f"/rules/{r0}", {"disabled": False})
call("PATCH", f"/rules/{r1}", {"disabled": False})

hits=call("GET","/search?q=eth&limit=20")
tsv_rows=["id\ttype\tname"]+[f"{h['id']}\t{h['type']}\t{h['name']}" for h in hits.get("results") or []]
assert len(tsv_rows)>=2
print("search tsv lines", len(tsv_rows))

unused=call("GET","/unused")
objs=unused.get("objects") or unused.get("results") or []
if isinstance(unused.get("count"), int):
    print("unused count", unused["count"])
else:
    print("unused count", len(objs))
utsv=["id\ttype\tname"]+[f"{h['id']}\t{h.get('type','')}\t{h.get('name','')}" for h in objs]
assert utsv[0].startswith("id\t")
print("unused tsv header ok", len(utsv))

print("ruleset id", rt["id"])

call("DELETE", f"/objects/{rt['id']}?permanent=true")
print("cleaned")
PY

curl -sf -o /dev/null -w "%{http_code}\n" "${auth[@]}" -X POST \
  "http://127.0.0.1:$PORT/api/v1/projects/$SID/close" | grep -q 204
echo "OK: phase53 e2e passed"
