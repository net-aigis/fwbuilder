#!/usr/bin/env bash
# Phase-143: openwrt family falls back to linux24 configlets.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"

BRIDGE="$ROOT/webui/bin/fwbweb"
API_DIR="$ROOT/webui/backend"
TOKEN="${FWBWEB_API_TOKEN:-dev-token}"
PORT="${FWBWEB_PORT:-18143}"
TMP="${TMPDIR:-/tmp}/fwbweb-e2e143-$$"
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

# Prefer openwrt dir if present, else linux24 via family
curl -sf "${auth[@]}" \
  "http://127.0.0.1:$PORT/api/v1/installer-configlets?host_os=openwrt" \
  >"$TMP/ow.json"

python3 - <<PY
import json
from pathlib import Path
d=json.load(open("$TMP/ow.json"))
cfg=d.get("configlet_dir") or ""
assert cfg, d
# openwrt may have its own dir or fall back to linux24
assert Path(cfg).name in {"openwrt", "linux24"}, cfg
assert "installer_commands_reg_user" in (d.get("names") or [])
print("openwrt resolve ok", cfg, d.get("family"))
print("cleaned")
PY
echo "OK: phase143 e2e passed"
