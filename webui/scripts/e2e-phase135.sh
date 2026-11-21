#!/usr/bin/env bash
# Phase-135: Configlet resolve (no blind linux24) + FreeBSD rc_conf flag.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"

BRIDGE="$ROOT/webui/bin/fwbweb"
API_DIR="$ROOT/webui/backend"
TOKEN="${FWBWEB_API_TOKEN:-dev-token}"
PORT="${FWBWEB_PORT:-18135}"
TMP="${TMPDIR:-/tmp}/fwbweb-e2e135-$$"
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
auth=(-H "Authorization: Bearer $TOKEN")

curl -sf "${auth[@]}" \
  "http://127.0.0.1:$PORT/api/v1/installer-configlet?host_os=ios&user=fwadmin&use_scp=true" \
  >"$TMP/ios.json"
curl -sf "${auth[@]}" \
  "http://127.0.0.1:$PORT/api/v1/installer-configlet?host_os=freebsd&user=fwadmin&generate_rc_conf=false" \
  >"$TMP/fb-shell.json"
curl -sf "${auth[@]}" \
  "http://127.0.0.1:$PORT/api/v1/installer-configlet?host_os=freebsd&user=fwadmin&generate_rc_conf=true" \
  >"$TMP/fb-rc.json"

python3 - <<PY
import json
ios=json.load(open("$TMP/ios.json"))
assert "ios" in (ios.get("configlet_dir") or ""), ios
assert "linux24" not in (ios.get("configlet_dir") or "")
prev=ios.get("preview") or {}
assert prev.get("ok") is True
cmd=(prev.get("command") or "").lower()
assert "copy" in cmd or "running-config" in cmd, prev
assert prev.get("interactive_installer") is True
print("ios resolve ok", ios.get("configlet_dir"))

shell=json.load(open("$TMP/fb-shell.json"))
rc=json.load(open("$TMP/fb-rc.json"))
assert "freebsd" in (shell.get("configlet_dir") or "")
sc=shell["preview"]["command"]
rcmd=rc["preview"]["command"]
assert "chmod" in sc or "sudo" in sc, sc
assert sc != rcmd, (sc, rcmd)
print("freebsd flags ok")
print("cleaned")
PY
echo "OK: phase135 e2e passed"
