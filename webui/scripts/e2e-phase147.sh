#!/usr/bin/env bash
# Phase-147: External PolicyInstallScript dry-run plan.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
API_DIR="$ROOT/webui/backend"
export FWBUILDER_RES_DIR="$ROOT/webui/.res"
source "$API_DIR/.venv/bin/activate"
TMP="${TMPDIR:-/tmp}/fwbweb-e2e147-$$"
mkdir -p "$TMP"
trap 'rm -rf "$TMP"' EXIT
touch "$TMP/dummy.fwb"
python3 - <<PY
from pathlib import Path
from fwbweb_api.deploy import plan_external_install
res = plan_external_install(
    command="/bin/echo",
    arguments="hello",
    fwb_path=Path("$TMP/dummy.fwb"),
    firewall_name="fw1",
    work_dir="$TMP",
    dry_run=True,
)
assert res["mode"] == "external_install_script"
assert res["activation_source"] == "install_script"
plan="\n".join(res["plan"])
assert "Run script" in plan
assert "-f" in plan and "fw1" in plan
assert "/bin/echo" in res["commands"][0]
print("external install dry-run ok")
# live echo should succeed
live = plan_external_install(
    command="/bin/echo",
    arguments="ok",
    fwb_path=Path("$TMP/dummy.fwb"),
    firewall_name="fw1",
    work_dir="$TMP",
    dry_run=False,
)
assert live["ok"]
assert "ok" in live["log"] or "fw1" in live["log"]
print("external install live ok")
print("cleaned")
PY
echo "OK: phase147 e2e passed"
