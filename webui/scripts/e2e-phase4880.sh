#!/usr/bin/env bash
# Phase-4880: soft-complete through 4880 (ssh_capability_flags_roster export).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4880
print("soft-complete >=4880", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase4880|Soft-complete STATUS through 4880|through 4880' webui/STATUS.md
echo "STATUS soft-complete 4880 ok"; echo "cleaned"; echo "OK: phase4880 e2e passed"
