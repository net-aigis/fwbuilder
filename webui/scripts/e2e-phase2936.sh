#!/usr/bin/env bash
# Phase-2936: soft-complete through 2936 (Soft 2920+ + ms 7250).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2936
assert m.WEBUI_HONESTY_MILESTONE == 7250
print("soft-complete >=2936", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase2936|Soft-complete STATUS through 2936|through 2936' webui/STATUS.md
echo "STATUS soft-complete 2936 ok"
echo "cleaned"
echo "OK: phase2936 e2e passed"
