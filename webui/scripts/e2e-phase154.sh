#!/usr/bin/env bash
# Phase-154: pix_os / junos interactive installer flags.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"

BRIDGE="$ROOT/webui/bin/fwbweb"
API_DIR="$ROOT/webui/backend"
TOKEN="${FWBWEB_API_TOKEN:-dev-token}"
PORT="${FWBWEB_PORT:-18154}"
TMP="${TMPDIR:-/tmp}/fwbweb-e2e154-$$"
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

for os in pix_os junos nxos procurve; do
  curl -sf "${auth[@]}" \
    "http://127.0.0.1:$PORT/api/v1/installer-configlets?host_os=$os" \
    >"$TMP/$os.json"
done

python3 - <<PY
import json,glob
for path in sorted(glob.glob("$TMP/*.json")):
    d=json.load(open(path))
    assert d.get("interactive_installer") is True, d
    assert d.get("note"), d
    assert "linux24" not in (d.get("configlet_dir") or "")
    print(d["host_os"], "interactive ok", Path_name := d.get("configlet_dir","").rsplit("/",1)[-1])
print("cleaned")
PY
echo "OK: phase154 e2e passed"
