#!/usr/bin/env bash
# Phase-144: live deploy rejects missing identity file.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
API_DIR="$ROOT/webui/backend"
export FWBUILDER_RES_DIR="$ROOT/webui/.res"
source "$API_DIR/.venv/bin/activate"
TMP="${TMPDIR:-/tmp}/fwbweb-e2e144-$$"
mkdir -p "$TMP"
trap 'rm -rf "$TMP"' EXIT
cat >"$TMP/fw.fw" <<'EOF'
# files: * fw.fw /etc/fw.fw
echo ok
EOF
python3 - <<PY
from pathlib import Path
from fwbweb_api.deploy import DeployError, plan_and_deploy
missing = Path("$TMP") / "no-such-key"
try:
    plan_and_deploy(
        local_script=Path("$TMP/fw.fw"),
        host="192.0.2.10",
        user="fwadmin",
        remote_dir="/etc",
        activate=False,
        identity_file=str(missing),
        dry_run=False,
    )
    raise SystemExit("expected DeployError")
except DeployError as exc:
    assert "identity file missing" in str(exc).lower() or "missing" in str(exc).lower()
    print("missing identity rejected ok")
print("cleaned")
PY
echo "OK: phase144 e2e passed"
