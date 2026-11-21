#!/usr/bin/env bash
# Phase-150: deploy mode field + external live confirm + host prefs persistence.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
API_DIR="$ROOT/webui/backend"
export FWBUILDER_RES_DIR="$ROOT/webui/.res"
source "$API_DIR/.venv/bin/activate"
TMP="${TMPDIR:-/tmp}/fwbweb-e2e150-$$"
mkdir -p "$TMP"
trap 'rm -rf "$TMP"' EXIT
cat >"$TMP/fw.fw" <<'EOF'
# files: * fw.fw /etc/fw.fw
echo ok
EOF
python3 - <<PY
from pathlib import Path
from fwbweb_api.deploy import plan_and_deploy, plan_external_install
scp = plan_and_deploy(
    local_script=Path("$TMP/fw.fw"),
    host="192.0.2.10",
    user="fwadmin",
    remote_dir="/etc",
    activate=False,
    dry_run=True,
)
assert scp.get("mode") == "scp_ssh"
ext = plan_external_install(
    command="/bin/true",
    fwb_path=Path("$TMP/fw.fw"),
    firewall_name="fw1",
    dry_run=True,
)
assert ext.get("mode") == "external_install_script"
print("deploy modes ok")
print("cleaned")
PY
extras="$ROOT/webui/frontend/src/components/FirewallExtras.tsx"
grep -q 'external install script on this machine' "$extras"
grep -q 'deployHost,' "$extras"
grep -q 'mode=' "$extras"
echo "OK: phase150 e2e passed"
