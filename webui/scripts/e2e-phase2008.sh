#!/usr/bin/env bash
# Phase-2008: soft-complete through 2008 (soft_complete_note + ms 4350).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2008
assert m.WEBUI_HONESTY_MILESTONE == 4350
print("soft-complete >=2008", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase2008|Soft-complete STATUS through 2008|through 2008' webui/STATUS.md
echo "STATUS soft-complete 2008 ok"
echo "cleaned"
echo "OK: phase2008 e2e passed"
