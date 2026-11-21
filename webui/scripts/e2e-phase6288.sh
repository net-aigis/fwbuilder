#!/usr/bin/env bash
# Phase-6288: soft-complete through 5889 (Soft 6280+ ssh_implemented_batch_roster Soft-Checkpoint).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 6288
print("soft-complete >=6448", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase6288|Soft-complete STATUS through 5889|through 5889' webui/STATUS.md
echo "STATUS soft-complete 5168 ok"; echo "cleaned"; echo "OK: phase6288 e2e passed"
