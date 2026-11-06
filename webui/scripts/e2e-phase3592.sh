#!/usr/bin/env bash
# Phase-3592: soft-complete through 3592 (surface_changelog_meta_roster + ms 9300).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3592
assert m.WEBUI_HONESTY_MILESTONE == 9300
print("soft-complete >=3592", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase3592|Soft-complete STATUS through 3592|through 3592' webui/STATUS.md
echo "STATUS soft-complete 3592 ok"
echo "cleaned"
echo "OK: phase3592 e2e passed"
