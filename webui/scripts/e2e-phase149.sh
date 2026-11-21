#!/usr/bin/env bash
# Phase-149: copyFWB adds .fwb to deploy plan.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
API_DIR="$ROOT/webui/backend"
export FWBUILDER_RES_DIR="$ROOT/webui/.res"
source "$API_DIR/.venv/bin/activate"
TMP="${TMPDIR:-/tmp}/fwbweb-e2e149-$$"
mkdir -p "$TMP"
trap 'rm -rf "$TMP"' EXIT
cat >"$TMP/fw.fw" <<'EOF'
# files: * fw.fw /etc/fw.fw
echo ok
EOF
touch "$TMP/project.fwb"
python3 - <<PY
from pathlib import Path
from fwbweb_api.deploy import plan_and_deploy
res = plan_and_deploy(
    local_script=Path("$TMP/fw.fw"),
    host="192.0.2.10",
    user="fwadmin",
    remote_dir="/etc",
    activate=False,
    copy_fwb=True,
    fwb_path=Path("$TMP/project.fwb"),
    dry_run=True,
)
plan="\n".join(res["plan"])
assert "Copy data file: project.fwb" in plan, plan
assert any("project.fwb" in c for c in res["commands"])
assert any(f["local"].endswith("project.fwb") for f in res["files"])
print("copyFWB plan ok")
print("cleaned")
PY
extras="$ROOT/webui/frontend/src/components/FirewallExtras.tsx"
grep -q 'Copy .fwb' "$extras"
grep -q 'copy_fwb: copyFwb' "$extras"
echo "OK: phase149 e2e passed"
