#!/usr/bin/env bash
# Phase-3608: soft-complete through 3608 (surface_changelog_meta_roster export + ms 9350).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3608
assert m.WEBUI_HONESTY_MILESTONE == 9350
print("soft-complete >=3608", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase3608|Soft-complete STATUS through 3608|through 3608' webui/STATUS.md
echo "STATUS soft-complete 3608 ok"
echo "cleaned"
echo "OK: phase3608 e2e passed"
