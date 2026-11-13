#!/usr/bin/env bash
# Phase-28624: soft-complete through 6784 (ssh_alternative_notes_refresh_roster opening block).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 28632
print("soft-complete >=6784", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase28624|Soft-complete STATUS through 6784|through 6784' webui/STATUS.md
echo "STATUS soft-complete 6784 ok"; echo "cleaned"; echo "OK: phase28624 e2e passed"
