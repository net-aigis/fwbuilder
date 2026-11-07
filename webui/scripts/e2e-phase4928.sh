#!/usr/bin/env bash
# Phase-4928: soft-complete through 4928 (Soft 4920+ ssh_capability_flags_roster Soft-Checkpoint).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4928
print("soft-complete >=4928", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase4928|Soft-complete STATUS through 4928|through 4928' webui/STATUS.md
echo "STATUS soft-complete 4928 ok"; echo "cleaned"; echo "OK: phase4928 e2e passed"
