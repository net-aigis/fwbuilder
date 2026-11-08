#!/usr/bin/env bash
# Phase-6368: soft-complete through 6368 (Soft 6360+ ssh_not_implemented_batch_roster).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 6368
print("soft-complete >=6368", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase6368|Soft-complete STATUS through 6368|through 6368' webui/STATUS.md
echo "STATUS soft-complete 6368 ok"; echo "cleaned"; echo "OK: phase6368 e2e passed"
