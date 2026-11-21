#!/usr/bin/env bash
# Phase-146: ios use_scp=false expands not_using_scp branch.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"

BRIDGE="$ROOT/webui/bin/fwbweb"
API_DIR="$ROOT/webui/backend"
TOKEN="${FWBWEB_API_TOKEN:-dev-token}"
PORT="${FWBWEB_PORT:-18146}"
TMP="${TMPDIR:-/tmp}/fwbweb-e2e146-$$"
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
  >"$TMP/scp.json"
curl -sf "${auth[@]}" \
  "http://127.0.0.1:$PORT/api/v1/installer-configlet?host_os=ios&user=fwadmin&use_scp=false" \
  >"$TMP/noscp.json"

python3 - <<PY
import json
scp=json.load(open("$TMP/scp.json"))["preview"]["command"].lower()
nos=json.load(open("$TMP/noscp.json"))["preview"]["command"].lower()
assert "copy" in scp or "running-config" in scp, scp
assert "config" in nos or "term" in nos, nos
assert scp != nos
print("ios use_scp branches ok")
print("cleaned")
PY
echo "OK: phase146 e2e passed"
