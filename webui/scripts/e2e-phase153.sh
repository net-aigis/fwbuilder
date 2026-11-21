#!/usr/bin/env bash
# Phase-153: remote_dir must be absolute.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
API_DIR="$ROOT/webui/backend"
export FWBUILDER_RES_DIR="$ROOT/webui/.res"
source "$API_DIR/.venv/bin/activate"
TMP="${TMPDIR:-/tmp}/fwbweb-e2e153-$$"
mkdir -p "$TMP"
trap 'rm -rf "$TMP"' EXIT
cat >"$TMP/fw.fw" <<'EOF'
# files: * fw.fw /etc/fw.fw
echo ok
EOF
python3 - <<PY
from pathlib import Path
from fwbweb_api.deploy import DeployError, plan_and_deploy
try:
    plan_and_deploy(
        local_script=Path("$TMP/fw.fw"),
        host="192.0.2.10",
        user="fwadmin",
        remote_dir="etc",
        activate=False,
        dry_run=True,
    )
    raise SystemExit("expected DeployError for relative remote_dir")
except DeployError as exc:
    assert "absolute" in str(exc).lower(), exc
    print("relative remote_dir rejected ok")
print("cleaned")
PY
echo "OK: phase153 e2e passed"
