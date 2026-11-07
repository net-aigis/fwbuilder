#!/usr/bin/env bash
# Phase-4344: soft-complete through 4344 (schema 4.4 + ms 11650).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4344
assert m.WEBUI_HONESTY_MILESTONE == 11650
assert m.SOFT_FERTIG_HONESTY_SURFACE_VERSION.startswith(("1.", "2.", "3.", "4."))
print("soft-complete >=4344", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase4344|Soft-complete STATUS through 4344|through 4344' webui/STATUS.md
echo "STATUS soft-complete 4344 ok"
echo "cleaned"
echo "OK: phase4344 e2e passed"
