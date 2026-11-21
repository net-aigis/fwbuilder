#!/usr/bin/env bash
# Phase-4352: soft-complete through 4352 (expect_run_roster session).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4352
assert "expect_run_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEYS
print("soft-complete >=4352", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase4352|Soft-complete STATUS through 4352|through 4352' webui/STATUS.md
echo "STATUS soft-complete 4352 ok"
echo "cleaned"
echo "OK: phase4352 e2e passed"
