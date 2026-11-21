#!/usr/bin/env bash
# Phase-152: plan shows file sizes; ssh ConnectTimeout in commands.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
API_DIR="$ROOT/webui/backend"
export FWBUILDER_RES_DIR="$ROOT/webui/.res"
source "$API_DIR/.venv/bin/activate"
TMP="${TMPDIR:-/tmp}/fwbweb-e2e152-$$"
mkdir -p "$TMP"
trap 'rm -rf "$TMP"' EXIT
# ~2 KiB file
python3 - <<PY
from pathlib import Path
p=Path("$TMP/fw.fw")
p.write_text("# files: * fw.fw /etc/fw.fw\n" + ("x"*2048) + "\n")
PY
python3 - <<PY
from pathlib import Path
from fwbweb_api.deploy import plan_and_deploy
res = plan_and_deploy(
    local_script=Path("$TMP/fw.fw"),
    host="192.0.2.10",
    user="fwadmin",
    remote_dir="/etc",
    activate=True,
    activation_cmd="true",
    dry_run=True,
)
plan="\n".join(res["plan"])
assert "KiB)" in plan or "bytes)" in plan, plan
assert any("ConnectTimeout=20" in c for c in res["commands"]), res["commands"]
print("size + ConnectTimeout ok")
print("cleaned")
PY
echo "OK: phase152 e2e passed"
