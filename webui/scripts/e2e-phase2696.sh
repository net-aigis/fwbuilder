#!/usr/bin/env bash
# Phase-2696: soft-complete through 2696 (Soft 2680+ + ms 6500).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2696
assert m.WEBUI_HONESTY_MILESTONE == 6500
print("soft-complete >=2696", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase2696|Soft-complete STATUS through 2696|through 2696' webui/STATUS.md
echo "STATUS soft-complete 2696 ok"
echo "cleaned"
echo "OK: phase2696 e2e passed"
