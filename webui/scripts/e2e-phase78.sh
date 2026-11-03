#!/usr/bin/env bash
# Phase-78: selected-rule TSV has header + one data row for a Policy rule.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"

BRIDGE="$ROOT/webui/bin/fwbweb"
API_DIR="$ROOT/webui/backend"
FIX="$ROOT/webui/fixtures/sample-v24.fwb"
TOKEN="${FWBWEB_API_TOKEN:-dev-token}"
PORT="${FWBWEB_PORT:-18178}"
TMP="${TMPDIR:-/tmp}/fwbweb-e2e78-$$"
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

def fmt(el):
    if not el: return ""
    objs=el.get("objects") or []
    return " ".join(o.get("name") or o.get("id") or "" for o in objs).replace("\t"," ").replace("\n"," ")

rules=call("GET", f"/rulesets/{FW}?which=policy")["rules"]
assert len(rules)>=1
r=rules[0]
cols=["id","pos","disabled","logging","direction","group","action","src","dst","srv","itf","when","comment"]
header="\t".join(cols)
row="\t".join([
  r["id"],
  str(r.get("position","")),
  "1" if r.get("disabled") else "0",
  "1" if r.get("logging") else "0",
  str(r.get("direction") or ""),
  str(r.get("group") or "").replace("\t"," ").replace("\n"," "),
  str(r.get("action") or ""),
  fmt(r.get("src")),
  fmt(r.get("dst")),
  fmt(r.get("srv")),
  fmt(r.get("itf")),
  fmt(r.get("when")),
  str(r.get("comment") or "").replace("\t"," ").replace("\n"," "),
])
tsv=header+"\n"+row
lines=tsv.splitlines()
assert len(lines)==2
assert lines[0].startswith("id\tpos\tdisabled")
assert lines[1].startswith(r["id"]+"\t")
print("selected tsv rows", len(lines), "id", r["id"], "pos", r.get("position"))
text=open("$ROOT/webui/frontend/src/shortcuts.ts").read()
assert 'keys: "t"' in text
print("cleaned")
PY

curl -sf -o /dev/null -w "%{http_code}\n" "${auth[@]}" -X POST \
  "http://127.0.0.1:$PORT/api/v1/projects/$SID/close" | grep -q 204
echo "OK: phase78 e2e passed"
