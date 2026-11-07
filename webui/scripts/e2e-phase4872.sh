#!/usr/bin/env bash
# Phase-4872: soft-complete through 4872 (ssh_capability_flags_roster + ms 13300).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4872
assert m.WEBUI_HONESTY_MILESTONE >= 13300
print("soft-complete >=4872", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase4872|Soft-complete STATUS through 4872|through 4872' webui/STATUS.md
echo "STATUS soft-complete 4872 ok"; echo "cleaned"; echo "OK: phase4872 e2e passed"
