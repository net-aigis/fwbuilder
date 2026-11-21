#!/usr/bin/env bash
# Phase-179: gzip transfer when compress=True (dry-run plan).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"

BRIDGE="$ROOT/webui/bin/fwbweb"
API_DIR="$ROOT/webui/backend"
TOKEN="${FWBWEB_API_TOKEN:-dev-token}"
PORT="${FWBWEB_PORT:-18179}"
TMP="${TMPDIR:-/tmp}/fwbweb-e2e179-$$"
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

# Unit-level: plan_and_deploy compress builds .gz scp + decompress ssh.
PYTHONPATH="$API_DIR${PYTHONPATH:+:$PYTHONPATH}" python3 - <<'PY'
import tempfile
from pathlib import Path
from fwbweb_api.deploy import plan_and_deploy

td = Path(tempfile.mkdtemp(prefix="fwbweb-gz-"))
script = td / "fw.fw"
script.write_text("#!/bin/sh\necho ok\n# files: * fw.fw\n", encoding="utf-8")
r = plan_and_deploy(
    host="192.0.2.9",
    user="root",
    local_script=script,
    remote_dir="/tmp/fwbweb-test",
    compress=True,
    dry_run=True,
    activate=False,
)
assert r["compress"] is True
assert any(".gz" in c for c in r["commands"]), r["commands"]
assert any("gzip -dc" in c for c in r["commands"]), r["commands"]
assert r["ssh_auth"]["batch_mode"] is True
assert r["ssh_auth"]["password_supported"] is False
plan = "\n".join(r["plan"])
assert "gunzip" in plan or "gzip" in plan
print("compress transfer plan ok")
print("cleaned")
PY

grep -q '_gzip_for_transfer' "$ROOT/webui/backend/fwbweb_api/deploy.py"
grep -q 'Compress transfer' "$ROOT/webui/frontend/src/components/FirewallExtras.tsx"
echo "OK: phase179 e2e passed"
