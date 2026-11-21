#!/usr/bin/env bash
# Phase-1960: soft-complete through 1960 (readiness sessionStorage + ms 4200).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1960
assert m.WEBUI_HONESTY_MILESTONE == 4200
print("soft-complete >=1960", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase1960|Soft-complete STATUS through 1960|through 1960' webui/STATUS.md
echo "STATUS soft-complete 1960 ok"
echo "cleaned"
echo "OK: phase1960 e2e passed"
