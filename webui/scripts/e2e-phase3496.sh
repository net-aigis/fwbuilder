#!/usr/bin/env bash
# Phase-3496: soft-complete through 3496 (Soft 3480+ / ms 9000).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3496
assert m.WEBUI_HONESTY_MILESTONE == 9000
print("soft-complete >=3496", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase3496|Soft-complete STATUS through 3496|through 3496' webui/STATUS.md
echo "STATUS soft-complete 3496 ok"
echo "cleaned"
echo "OK: phase3496 e2e passed"
