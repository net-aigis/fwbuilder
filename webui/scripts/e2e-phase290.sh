#!/usr/bin/env bash
# Phase-290: expect run accepts optional step= and still refuses 501.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'step_refused' webui/backend/fwbweb_api/expect_installer.py
grep -Fq 'step:' webui/backend/fwbweb_api/routes/platforms.py
grep -Fq 'refuseExpectInstallStep' webui/frontend/src/api/client.ts
grep -Fq 'Probe expect step' webui/frontend/src/components/FirewallExtras.tsx
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api.expect_installer import refuse_expect_install
r=refuse_expect_install("ios", step="ssh_open")
assert r["step"]=="ssh_open" and r["step_refused"] is True
assert r["error"]=="expect_installer_not_implemented"
print("step refuse ok")
print("cleaned")
PY
echo "OK: phase290 e2e passed"
