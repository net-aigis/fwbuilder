#!/usr/bin/env bash
# Phase-305: walkthrough timeline stamps (simulated_at / timeline_start).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'simulated_at' webui/backend/fwbweb_api/expect_installer.py
grep -Fq 'timeline_start' webui/backend/fwbweb_api/expect_installer.py
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api.expect_installer import expect_install_walkthrough
w=expect_install_walkthrough("ios")
assert w["timeline_start"]
assert all(s.get("simulated_at") for s in w["steps"])
assert all(s.get("ordinal") for s in w["steps"])
print("timeline ok", w["timeline_start"], w["step_count"])
print("cleaned")
PY
echo "OK: phase305 e2e passed"
