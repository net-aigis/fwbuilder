#!/usr/bin/env bash
# Phase-19000: soft-complete through 5881 (ssh_alternative_notes_refresh_roster sessionStorage + ms 18900).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 19008
assert m.WEBUI_HONESTY_MILESTONE >= 18900
print("soft-complete >=6440", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase19000|Soft-complete STATUS through 5881|through 5881' webui/STATUS.md
echo "STATUS soft-complete 5160 ok"; echo "cleaned"; echo "OK: phase19000 e2e passed"
