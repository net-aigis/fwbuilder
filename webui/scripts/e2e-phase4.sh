#!/usr/bin/env bash
# Phase-4 local E2E: firewall options + management + deploy dry-run.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"

BRIDGE="$ROOT/webui/bin/fwbweb"
API_DIR="$ROOT/webui/backend"
FIX="$ROOT/webui/fixtures/sample-v24.fwb"
TOKEN="${FWBWEB_API_TOKEN:-dev-token}"
PORT="${FWBWEB_PORT:-18091}"
TMP="${TMPDIR:-/tmp}/fwbweb-e2e4-$$"
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
print(d["results"][0]["id"])
PY
)

echo "== options =="
curl -sf "${auth[@]}" \
  "http://127.0.0.1:$PORT/api/v1/projects/$SID/objects/$FW/options" >"$TMP/opts.json"
python3 - <<PY
import json
d=json.load(open("$TMP/opts.json"))
opts=d["options"]
print("keys", len(opts))
assert "firewall_dir" in opts, opts
assert "admUser" in opts
open("$TMP/old_dir.txt","w").write(opts.get("firewall_dir",""))
PY

echo "== patch options =="
curl -sf "${auth[@]}" -X PATCH -d '{"options":{"firewall_dir":"/tmp/fwbweb-e2e","admUser":"fwadmin"}}' \
  "http://127.0.0.1:$PORT/api/v1/projects/$SID/objects/$FW/options" >"$TMP/opts2.json"
python3 - <<PY
import json
d=json.load(open("$TMP/opts2.json"))
assert d["options"]["firewall_dir"]=="/tmp/fwbweb-e2e", d
assert d["options"]["admUser"]=="fwadmin", d
print("patched ok")
PY

echo "== management =="
curl -sf "${auth[@]}" -X PATCH -d '{"address":"203.0.113.50"}' \
  "http://127.0.0.1:$PORT/api/v1/projects/$SID/objects/$FW/management" >"$TMP/mgmt.json"
python3 - <<PY
import json
d=json.load(open("$TMP/mgmt.json"))
assert d["management"]["address"]=="203.0.113.50", d
print("mgmt", d["management"]["address"])
PY

echo "== deploy dry-run =="
HTTP=$(curl -s -o "$TMP/deploy.json" -w "%{http_code}" "${auth[@]}" \
  -d "{\"firewall_id\":\"$FW\",\"dry_run\":true,\"compile_first\":true}" \
  "http://127.0.0.1:$PORT/api/v1/projects/$SID/deploy" || true)
echo "deploy http=$HTTP"
python3 - <<PY
import json, sys
http=int("$HTTP")
d=json.load(open("$TMP/deploy.json"))
if http != 200:
    print(json.dumps(d, indent=2)[:2000])
    sys.exit(1)
print(json.dumps({k:d[k] for k in ("ok","firewall","platform")}, indent=2))
dep=d["deploy"]
assert dep["dry_run"] is True
assert dep["host"]=="203.0.113.50", dep
assert dep["user"]=="fwadmin", dep
# Absolute `# files:` remote wins over firewall_dir (FirewallInstaller semantics).
rp=dep["remote_path"]
assert rp.endswith("firewall.fw") or "/tmp/fwbweb-e2e" in rp, dep
assert any("scp" in c for c in dep["commands"]), dep
assert isinstance(dep.get("manifest"), list)
print("commands:")
for c in dep["commands"]:
    print(" ", c)
PY

curl -sf "${auth[@]}" -d '{}' "http://127.0.0.1:$PORT/api/v1/projects/$SID/save" >/dev/null
curl -sf -o /dev/null -w "%{http_code}\n" "${auth[@]}" -X POST \
  "http://127.0.0.1:$PORT/api/v1/projects/$SID/close" | grep -q 204

echo "OK: phase4 e2e passed"
