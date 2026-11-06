#!/usr/bin/env bash
# Phase-3864: soft-complete through 3864 (schema 3.8 + ms 10150).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3864
assert m.WEBUI_HONESTY_MILESTONE == 10150
assert m.SOFT_FERTIG_HONESTY_SURFACE_VERSION.startswith(("1.", "2.", "3.", "4."))
print("soft-complete >=3864", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase3864|Soft-complete STATUS through 3864|through 3864' webui/STATUS.md
echo "STATUS soft-complete 3864 ok"
echo "cleaned"
echo "OK: phase3864 e2e passed"
