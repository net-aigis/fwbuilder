#!/usr/bin/env bash
# Phase-31: copy/duplicate rule into another Policy ruleset.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"

BRIDGE="$ROOT/webui/bin/fwbweb"
API_DIR="$ROOT/webui/backend"
FIX="$ROOT/webui/fixtures/sample-v24.fwb"
TOKEN="${FWBWEB_API_TOKEN:-dev-token}"
PORT="${FWBWEB_PORT:-18121}"
TMP="${TMPDIR:-/tmp}/fwbweb-e2e31-$$"
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

# create secondary policy
pol=call("POST","/objects",{"parent_id": FW, "type":"Policy", "name":"webui-e2e-copytgt"})
assert pol["type"]=="Policy", pol
tgt=pol["id"]

rules=call("GET", f"/rulesets/{FW}?which=policy")["rules"]
assert rules, rules
src=rules[0]
copied=call("POST", f"/rules/{src['id']}/duplicate", {"ruleset_id": tgt})
print("copied", copied.get("id"), "comment", copied.get("comment"), "action", copied.get("action"))
assert copied.get("id") and copied["id"]!=src["id"]

# appears in target ruleset
tgt_rules=call("GET", f"/rulesets/{tgt}?which=policy")["rules"]
print("target rule count", len(tgt_rules))
assert any(r["id"]==copied["id"] for r in tgt_rules), tgt_rules
# still in source
src_rules=call("GET", f"/rulesets/{FW}?which=policy")["rules"]
assert any(r["id"]==src["id"] for r in src_rules)

# type mismatch rejected (Policy rule → NAT ruleset)
nats=[r for r in call("GET", f"/objects/{FW}").get("ruleset_list") or [] if r.get("type")=="NAT"]
assert nats, "need NAT ruleset"
try:
    call("POST", f"/rules/{src['id']}/duplicate", {"ruleset_id": nats[0]["id"]})
    raise AssertionError("expected type mismatch")
except AssertionError as e:
    if "expected type mismatch" in str(e):
        raise
    assert "mismatch" in str(e).lower() or "400" in str(e), e
    print("mismatch ok", str(e)[:160])

call("DELETE", f"/rules/{copied['id']}")
call("DELETE", f"/objects/{tgt}")
print("cleaned")
PY

curl -sf -o /dev/null -w "%{http_code}\n" "${auth[@]}" -X POST \
  "http://127.0.0.1:$PORT/api/v1/projects/$SID/close" | grep -q 204
echo "OK: phase31 e2e passed"
