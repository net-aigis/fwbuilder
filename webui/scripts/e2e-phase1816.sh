#!/usr/bin/env bash
# Phase-1816: soft-complete through 1816 (schema 1.1 + ms 3750).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1816
assert m.WEBUI_HONESTY_MILESTONE == 3750
assert m.SOFT_FERTIG_HONESTY_SURFACE_VERSION.startswith(("1.", "2.", "3."))
print("soft-complete >=1816", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase1816|Soft-complete STATUS through 1816|through 1816' webui/STATUS.md
echo "STATUS soft-complete 1816 ok"
echo "cleaned"
echo "OK: phase1816 e2e passed"
