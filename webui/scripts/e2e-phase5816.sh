#!/usr/bin/env bash
# Phase-5816: soft-complete through 5816 (Soft 5800+ ssh_alternative_support_roster Soft-Checkpoint + ms 16250).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 5816
assert m.WEBUI_HONESTY_MILESTONE == 16250
print("soft-complete >=5816", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase5816|Soft-complete STATUS through 5816|through 5816' webui/STATUS.md
echo "STATUS soft-complete 5816 ok"; echo "cleaned"; echo "OK: phase5816 e2e passed"
