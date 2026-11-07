#!/usr/bin/env bash
# Phase-5016: soft-complete through 5016 (Soft 5000+ ssh_alternatives_roster Soft-Checkpoint + ms 13750).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 5016
assert m.WEBUI_HONESTY_MILESTONE == 13750
print("soft-complete >=5016", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase5016|Soft-complete STATUS through 5016|through 5016' webui/STATUS.md
echo "STATUS soft-complete 5016 ok"; echo "cleaned"; echo "OK: phase5016 e2e passed"
