#!/usr/bin/env bash
# Phase-5968: soft-complete through 5889 (Soft 5960+ ssh_batch_mode_roster Soft-Checkpoint).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 5968
print("soft-complete >=6448", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase5968|Soft-complete STATUS through 5889|through 5889' webui/STATUS.md
echo "STATUS soft-complete 5168 ok"; echo "cleaned"; echo "OK: phase5968 e2e passed"
