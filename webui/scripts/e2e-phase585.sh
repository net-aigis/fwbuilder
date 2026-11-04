#!/usr/bin/env bash
# Phase-585: refusals include unknown_step_probe.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'unknown_step_probe' webui/backend/fwbweb_api/expect_installer.py
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api.expect_installer import expect_plan_step_refusals
r = expect_plan_step_refusals("ios")
assert r["unknown_step_probe"]["unknown_step"] is True
assert r["unknown_step_probe"]["error"] == "expect_installer_unknown_step"
assert r.get("run_path") and r.get("steps_path")
print("unknown probe ok", r["unknown_step_probe"]["step"])
PY
echo "cleaned"
echo "OK: phase585 e2e passed"
