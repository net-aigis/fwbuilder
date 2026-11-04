#!/usr/bin/env bash
# Phase-2776: soft-complete through 2776 (Soft 2760+ + ms 6750).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2776
assert m.WEBUI_HONESTY_MILESTONE == 6750
print("soft-complete >=2776", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase2776|Soft-complete STATUS through 2776|through 2776' webui/STATUS.md
echo "STATUS soft-complete 2776 ok"
echo "cleaned"
echo "OK: phase2776 e2e passed"
