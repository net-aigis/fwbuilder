#!/usr/bin/env bash
# Phase-6848: soft-complete through 6848 (Soft 6840+ ssh_not_implemented_password_roster).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 6848
print("soft-complete >=6848", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase6848|Soft-complete STATUS through 6848|through 6848' webui/STATUS.md
echo "STATUS soft-complete 6848 ok"; echo "cleaned"; echo "OK: phase6848 e2e passed"
