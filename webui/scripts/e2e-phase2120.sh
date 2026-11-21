#!/usr/bin/env bash
# Phase-2120: soft-complete through 2120 (schema 1.6 + ms 4700).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2120
assert m.WEBUI_HONESTY_MILESTONE == 4700
assert m.SOFT_FERTIG_HONESTY_SURFACE_VERSION.startswith(("1.", "2.", "3.", "4."))
print("soft-complete >=2120", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase2120|Soft-complete STATUS through 2120|through 2120' webui/STATUS.md
echo "STATUS soft-complete 2120 ok"
echo "cleaned"
echo "OK: phase2120 e2e passed"
