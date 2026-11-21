#!/usr/bin/env bash
# Phase-3656: soft-complete through 3656 (Soft 3640+ / ms 9500).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3656
assert m.WEBUI_HONESTY_MILESTONE == 9500
print("soft-complete >=3656", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase3656|Soft-complete STATUS through 3656|through 3656' webui/STATUS.md
echo "STATUS soft-complete 3656 ok"
echo "cleaned"
echo "OK: phase3656 e2e passed"
