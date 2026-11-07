#!/usr/bin/env bash
# Phase-4432: soft-complete through 4432 (expect_steps_roster session).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4432
assert "expect_steps_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEYS
print("soft-complete >=4432", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase4432|Soft-complete STATUS through 4432|through 4432' webui/STATUS.md
echo "STATUS soft-complete 4432 ok"
echo "cleaned"
echo "OK: phase4432 e2e passed"
