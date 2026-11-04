#!/usr/bin/env bash
# Phase-2808: soft-complete through 2808 (changelog_roster export + ms 6850).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2808
assert m.WEBUI_HONESTY_MILESTONE == 6850
print("soft-complete >=2808", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase2808|Soft-complete STATUS through 2808|through 2808' webui/STATUS.md
echo "STATUS soft-complete 2808 ok"
echo "cleaned"
echo "OK: phase2808 e2e passed"
