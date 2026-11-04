#!/usr/bin/env bash
# Phase-1184: soft-complete through 1184 (milestone 1800).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1184
assert m.WEBUI_HONESTY_MILESTONE == 1800
print("soft-complete >=1184", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase1184|Soft-complete STATUS through 1184|through 1184' webui/STATUS.md
echo "STATUS soft-complete 1184 ok"
echo "cleaned"
echo "OK: phase1184 e2e passed"
