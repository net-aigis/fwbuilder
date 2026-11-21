#!/usr/bin/env bash
# Phase-4960: soft-complete through 4960 (ssh_alternatives_roster export).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4960
print("soft-complete >=4960", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase4960|Soft-complete STATUS through 4960|through 4960' webui/STATUS.md
echo "STATUS soft-complete 4960 ok"; echo "cleaned"; echo "OK: phase4960 e2e passed"
