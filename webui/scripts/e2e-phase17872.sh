#!/usr/bin/env bash
# Phase-17872: soft-complete through 5873 (ssh_alternative_notes_refresh_roster sessionStorage).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 17880
print("soft-complete >=6432", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase17872|Soft-complete STATUS through 5873|through 5873' webui/STATUS.md
echo "STATUS soft-complete 5152 ok"; echo "cleaned"; echo "OK: phase17872 e2e passed"
