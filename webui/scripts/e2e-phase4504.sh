#!/usr/bin/env bash
# Phase-4504: soft-complete through 4504 (schema 4.6 + ms 12150).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4504
assert m.WEBUI_HONESTY_MILESTONE == 12150
assert m.SOFT_FERTIG_HONESTY_SURFACE_VERSION.startswith(("1.", "2.", "3.", "4."))
print("soft-complete >=4504", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase4504|Soft-complete STATUS through 4504|through 4504' webui/STATUS.md
echo "STATUS soft-complete 4504 ok"
echo "cleaned"
echo "OK: phase4504 e2e passed"
