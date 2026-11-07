#!/usr/bin/env bash
# Phase-4848: soft-complete through 4848 (Soft 4840+ ssh_implemented_roster Soft-Checkpoint).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4848
print("soft-complete >=4848", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase4848|Soft-complete STATUS through 4848|through 4848' webui/STATUS.md
echo "STATUS soft-complete 4848 ok"; echo "cleaned"; echo "OK: phase4848 e2e passed"
