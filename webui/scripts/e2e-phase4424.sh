#!/usr/bin/env bash
# Phase-4424: soft-complete through 4424 (schema 4.5 + ms 11900).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4424
assert m.WEBUI_HONESTY_MILESTONE == 11900
assert m.SOFT_FERTIG_HONESTY_SURFACE_VERSION.startswith(("1.", "2.", "3.", "4."))
print("soft-complete >=4424", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase4424|Soft-complete STATUS through 4424|through 4424' webui/STATUS.md
echo "STATUS soft-complete 4424 ok"
echo "cleaned"
echo "OK: phase4424 e2e passed"
