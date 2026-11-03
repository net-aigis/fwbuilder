#!/usr/bin/env bash
# Phase-142: SSH identity_file expands ~ and is reported.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
API_DIR="$ROOT/webui/backend"
export FWBUILDER_RES_DIR="$ROOT/webui/.res"
source "$API_DIR/.venv/bin/activate"
TMP="${TMPDIR:-/tmp}/fwbweb-e2e142-$$"
mkdir -p "$TMP"
trap 'rm -rf "$TMP"' EXIT

# Minimal script with manifest
cat >"$TMP/fw.fw" <<'EOF'
# files: * fw.fw /etc/fw.fw
echo ok
EOF

python3 - <<PY
from pathlib import Path
from fwbweb_api.deploy import plan_and_deploy
home = str(Path.home())
res = plan_and_deploy(
    local_script=Path("$TMP/fw.fw"),
    host="192.0.2.10",
    user="fwadmin",
    remote_dir="/etc",
    activate=False,
    identity_file="~/.ssh/id_ed25519_fwbweb_e2e_missing",
    dry_run=True,
)
assert res["identity_file"] == f"{home}/.ssh/id_ed25519_fwbweb_e2e_missing"
assert any(f"{home}/.ssh/id_ed25519_fwbweb_e2e_missing" in c for c in res["commands"])
print("identity expand ok", res["identity_file"])
print("cleaned")
PY
echo "OK: phase142 e2e passed"
