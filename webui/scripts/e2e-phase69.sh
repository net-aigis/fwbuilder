#!/usr/bin/env bash
# Phase-69: where-used rule rows expose parent ruleset for Rules-tab jump.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"

BRIDGE="$ROOT/webui/bin/fwbweb"
API_DIR="$ROOT/webui/backend"
FIX="$ROOT/webui/fixtures/sample-v24.fwb"
TOKEN="${FWBWEB_API_TOKEN:-dev-token}"
PORT="${FWBWEB_PORT:-18159}"
TMP="${TMPDIR:-/tmp}/fwbweb-e2e69-$$"
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

# Object known to appear in Policy rule 1 (http service)
svc=[r for r in call("GET","/search?q=http&type=TCPService&limit=20")["results"]
     if r.get("name")=="http"][0]
wu=call("GET", f"/objects/{svc['id']}/where-used")
uses=wu.get("uses") or []
rule_rows=[u for u in uses if str(u.get("type","")).endswith("Rule")]
print("where-used rules", len(rule_rows), "of", len(uses))
assert rule_rows, uses
row=rule_rows[0]
assert row.get("parent_id") and row.get("parent_type") in ("Policy","NAT","Routing"), row
print("rule", row.get("id"), row.get("type"), "parent", row.get("parent_type"), row.get("parent_id"))

path=call("GET", f"/objects/{row['id']}/path")["path"]
fw=next(p for p in reversed(path) if p.get("type") in ("Firewall","Cluster"))
print("path fw", fw.get("name"), fw.get("id"))
assert fw.get("id")==FW

which="policy" if row["parent_type"]=="Policy" else ("nat" if row["parent_type"]=="NAT" else "routing")
rules=call("GET", f"/rulesets/{row['parent_id']}?which={which}")["rules"]
assert any(r["id"]==row["id"] for r in rules), [r["id"] for r in rules]
print("jump target found in ruleset")
print("cleaned")
PY

curl -sf -o /dev/null -w "%{http_code}\n" "${auth[@]}" -X POST \
  "http://127.0.0.1:$PORT/api/v1/projects/$SID/close" | grep -q 204
echo "OK: phase69 e2e passed"
