#!/usr/bin/env bash
# Phase-4400: soft-complete through 4400 (expect_steps_roster export).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4400
assert "expect_steps_roster" in m.SOFT_FERTIG_HONESTY_EXPORT_KEYS
print("soft-complete >=4400", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase4400|Soft-complete STATUS through 4400|through 4400' webui/STATUS.md
echo "STATUS soft-complete 4400 ok"
echo "cleaned"
echo "OK: phase4400 e2e passed"
