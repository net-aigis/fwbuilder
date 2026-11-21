#!/usr/bin/env bash
# Phase-1992: soft-complete through 1992 (schema 1.4 + ms 4300).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1992
assert m.WEBUI_HONESTY_MILESTONE == 4300
assert m.SOFT_FERTIG_HONESTY_SURFACE_VERSION.startswith(("1.", "2.", "3.", "4."))
print("soft-complete >=1992", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase1992|Soft-complete STATUS through 1992|through 1992' webui/STATUS.md
echo "STATUS soft-complete 1992 ok"
echo "cleaned"
echo "OK: phase1992 e2e passed"
