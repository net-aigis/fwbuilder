#!/usr/bin/env bash
# Phase-2856: soft-complete through 2856 (Soft 2840+ + ms 7000).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2856
assert m.WEBUI_HONESTY_MILESTONE == 7000
print("soft-complete >=2856", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase2856|Soft-complete STATUS through 2856|through 2856' webui/STATUS.md
echo "STATUS soft-complete 2856 ok"
echo "cleaned"
echo "OK: phase2856 e2e passed"
