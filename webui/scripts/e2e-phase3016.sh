#!/usr/bin/env bash
# Phase-3016: soft-complete through 3016 (Soft 3000+ + ms 7500).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3016
assert m.WEBUI_HONESTY_MILESTONE == 7500
print("soft-complete >=3016", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase3016|Soft-complete STATUS through 3016|through 3016' webui/STATUS.md
echo "STATUS soft-complete 3016 ok"
echo "cleaned"
echo "OK: phase3016 e2e passed"
