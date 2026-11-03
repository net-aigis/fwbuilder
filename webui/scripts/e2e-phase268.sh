#!/usr/bin/env bash
# Phase-268: expect install walkthrough (all preview_only).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'expect_install_walkthrough' webui/backend/fwbweb_api/expect_installer.py
grep -Fq 'expect-install-plan/walkthrough' webui/backend/fwbweb_api/routes/platforms.py
grep -Fq 'fetchExpectInstallWalkthrough' webui/frontend/src/api/client.ts
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api.expect_installer import expect_install_walkthrough
w=expect_install_walkthrough("ios")
assert w["walkthrough"] and w["all_preview_only"] and not w["executable"]
assert w["step_count"] >= 5
assert all(s["status"]=="preview_only" and s["runnable"] is False for s in w["steps"])
print("walkthrough ok", w["step_count"])
print("cleaned")
PY
echo "OK: phase268 e2e passed"
