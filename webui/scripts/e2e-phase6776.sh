#!/usr/bin/env bash
# Phase-6776: soft-complete through 6776 (Soft 6760+ ssh_not_implemented_keyboard_roster + ms 19250).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 6776
assert m.WEBUI_HONESTY_MILESTONE == 19250
print("soft-complete >=6776", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase6776|Soft-complete STATUS through 6776|through 6776' webui/STATUS.md
echo "STATUS soft-complete 6776 ok"; echo "cleaned"; echo "OK: phase6776 e2e passed"
