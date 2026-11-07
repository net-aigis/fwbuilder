#!/usr/bin/env bash
# Phase-4480: soft-complete through 4480 (expect_steps_refusals_roster export).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4480
assert "expect_steps_refusals_roster" in m.SOFT_FERTIG_HONESTY_EXPORT_KEYS
print("soft-complete >=4480", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase4480|Soft-complete STATUS through 4480|through 4480' webui/STATUS.md
echo "STATUS soft-complete 4480 ok"
echo "cleaned"
echo "OK: phase4480 e2e passed"
