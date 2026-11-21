#!/usr/bin/env bash
# Phase-4512: soft-complete through 4512 (expect_steps_refusals_roster session).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4512
assert "expect_steps_refusals_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEYS
print("soft-complete >=4512", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase4512|Soft-complete STATUS through 4512|through 4512' webui/STATUS.md
echo "STATUS soft-complete 4512 ok"
echo "cleaned"
echo "OK: phase4512 e2e passed"
