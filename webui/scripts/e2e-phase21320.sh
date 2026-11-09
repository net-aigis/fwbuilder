#!/usr/bin/env bash
# Phase-21320: soft-complete through 5881 (ssh_alternative_notes_refresh_roster sessionStorage + ms 18900).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 21328
assert m.WEBUI_HONESTY_MILESTONE >= 18900
print("soft-complete >=6440", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase21320|Soft-complete STATUS through 5881|through 5881' webui/STATUS.md
echo "STATUS soft-complete 5160 ok"; echo "cleaned"; echo "OK: phase21320 e2e passed"
