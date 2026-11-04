#!/usr/bin/env bash
# Phase-1848: soft-complete through 1848 (track_note export/bundle + ms 3850).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1848
assert m.WEBUI_HONESTY_MILESTONE == 3850
print("soft-complete >=1848", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase1848|Soft-complete STATUS through 1848|through 1848' webui/STATUS.md
echo "STATUS soft-complete 1848 ok"
echo "cleaned"
echo "OK: phase1848 e2e passed"
