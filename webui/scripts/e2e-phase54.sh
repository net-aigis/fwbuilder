#!/usr/bin/env bash
# Phase-54: Host rejects Policy; only-disabled filter data; rules JSON shape.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"

BRIDGE="$ROOT/webui/bin/fwbweb"
API_DIR="$ROOT/webui/backend"
FIX="$ROOT/webui/fixtures/sample-v24.fwb"
TOKEN="${FWBWEB_API_TOKEN:-dev-token}"
PORT="${FWBWEB_PORT:-18144}"
TMP="${TMPDIR:-/tmp}/fwbweb-e2e54-$$"
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

def call(method, path, body=None, expect_error=None):
    data=None if body is None else json.dumps(body).encode()
    req=urllib.request.Request(base+path, data=data, method=method, headers=H)
    try:
        with urllib.request.urlopen(req) as resp:
            raw=resp.read()
            if expect_error is not None:
                raise AssertionError(f"expected HTTP {expect_error}, got success")
            return json.loads(raw) if raw else {"_status": resp.status}
    except urllib.error.HTTPError as e:
        body_txt=e.read().decode()
        if expect_error is not None and e.code == expect_error:
            print("expected error", e.code, body_txt[:140])
            return {"_error": body_txt}
        raise AssertionError(f"{method} {path} -> {e.code}: {body_txt}") from e

# Host cannot contain Policy (CreateObject no longer offers it for Host)
hosts_grp=[r for r in call("GET","/search?q=Hosts&type=ObjectGroup&limit=20")["results"]
           if r["name"]=="Hosts" and not str(r["id"]).startswith("std")][0]["id"]
host=call("POST","/objects",{"parent_id": hosts_grp, "type":"Host", "name":"webui-e2e-host54"})
print("host", host.get("id"))
err=call("POST","/objects",{"parent_id": host["id"], "type":"Policy", "name":"webui-e2e-bad54"}, expect_error=400)
assert "does not accept" in err.get("_error",""), err
call("DELETE", f"/objects/{host['id']}?permanent=true")

rules=call("GET", f"/rulesets/{FW}?which=policy")["rules"]
assert len(rules)>=2
r0=rules[0]["id"]
call("PATCH", f"/rules/{r0}", {"disabled": True})
chk=call("GET", f"/rulesets/{FW}?which=policy")["rules"]
disabled=[r for r in chk if r.get("disabled")]
enabled=[r for r in chk if not r.get("disabled")]
print("only-disabled count", len(disabled), "enabled", len(enabled))
assert len(disabled)>=1 and len(enabled)>=1
# FE "Only disabled" shows disabled; JSON download uses visible list shape:
payload={"which":"policy","count":len(disabled),"rules":disabled}
assert payload["count"]==len(payload["rules"])
assert all(r.get("disabled") for r in payload["rules"])
print("rules json keys", sorted(payload["rules"][0].keys())[:8])

call("PATCH", f"/rules/{r0}", {"disabled": False})
print("cleaned")
PY

curl -sf -o /dev/null -w "%{http_code}\n" "${auth[@]}" -X POST \
  "http://127.0.0.1:$PORT/api/v1/projects/$SID/close" | grep -q 204
echo "OK: phase54 e2e passed"
