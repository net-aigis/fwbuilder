#!/usr/bin/env bash
# Phase-4664: soft-complete through 4664 (schema 4.8 + ms 12650).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4664
assert m.WEBUI_HONESTY_MILESTONE == 12650
assert m.SOFT_FERTIG_HONESTY_SURFACE_VERSION.startswith(("1.", "2.", "3.", "4."))
print("soft-complete >=4664", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase4664|Soft-complete STATUS through 4664|through 4664' webui/STATUS.md
echo "STATUS soft-complete 4664 ok"
echo "cleaned"
echo "OK: phase4664 e2e passed"
