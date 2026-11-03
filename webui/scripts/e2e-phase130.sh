#!/usr/bin/env bash
# Phase-130: Default-Aktivierung aus OS-Installer-Configlets.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"

BRIDGE="$ROOT/webui/bin/fwbweb"
API_DIR="$ROOT/webui/backend"
FIX="$ROOT/webui/fixtures/sample-v24.fwb"
TOKEN="${FWBWEB_API_TOKEN:-dev-token}"
PORT="${FWBWEB_PORT:-18130}"
TMP="${TMPDIR:-/tmp}/fwbweb-e2e130-$$"
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

curl -sf "${auth[@]}" -X PATCH -d '{"address":"203.0.113.50"}' \
  "http://127.0.0.1:$PORT/api/v1/projects/$SID/objects/$FW/management" >/dev/null
# Ensure empty activationCmd so configlet path is used
curl -sf "${auth[@]}" -X PATCH -d '{"options":{"activationCmd":"","admUser":"fwadmin"}}' \
  "http://127.0.0.1:$PORT/api/v1/projects/$SID/objects/$FW/options" >/dev/null

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
            return json.loads(raw) if raw else {}
    except urllib.error.HTTPError as e:
        raise AssertionError(f"{method} {path} -> {e.code}: {e.read().decode()}") from e

res=call("POST","/deploy",{"firewall_id":FW,"dry_run":True,"compile_first":True})
dep=res.get("deploy") or {}
print("activation_source", dep.get("activation_source"))
print("activation_cmd", dep.get("activation_cmd"))
print("plan", dep.get("plan"))
assert dep.get("activation_source") in ("fallback",) or (
    dep.get("activation_source") and "installer_commands" in str(dep.get("activation_source"))
) or "Policy activated" in str(dep.get("activation_cmd")) or "sudo" in str(dep.get("activation_cmd"))
assert isinstance(dep.get("plan"), list) and len(dep["plan"]) >= 2
assert any("Copy file:" in p for p in dep["plan"])
assert any("Activate:" in p for p in dep["plan"])
# Prefer configlet path
src=str(dep.get("activation_source") or "")
assert "installer_commands" in src or "Policy activated" in str(dep.get("activation_cmd")), dep
print("cleaned")
PY

curl -sf -o /dev/null -w "%{http_code}\n" "${auth[@]}" -X POST \
  "http://127.0.0.1:$PORT/api/v1/projects/$SID/close" | grep -q 204
echo "OK: phase130 e2e passed"
