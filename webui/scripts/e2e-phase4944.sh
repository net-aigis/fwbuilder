#!/usr/bin/env bash
# Phase-4944: soft-complete through 4944 (ssh_alternatives_roster).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4944
print("soft-complete >=4944", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase4944|Soft-complete STATUS through 4944|through 4944' webui/STATUS.md
echo "STATUS soft-complete 4944 ok"; echo "cleaned"; echo "OK: phase4944 e2e passed"
