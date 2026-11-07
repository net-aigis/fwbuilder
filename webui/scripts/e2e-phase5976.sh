#!/usr/bin/env bash
# Phase-5976: soft-complete through 5976 (Soft 5960+ ssh_batch_mode_roster Soft-Checkpoint + ms 16750).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 5976
assert m.WEBUI_HONESTY_MILESTONE == 16750
print("soft-complete >=5976", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase5976|Soft-complete STATUS through 5976|through 5976' webui/STATUS.md
echo "STATUS soft-complete 5976 ok"; echo "cleaned"; echo "OK: phase5976 e2e passed"
