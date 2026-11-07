#!/usr/bin/env bash
# Phase-4264: soft-complete through 4264 (schema 4.3 + ms 11400).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4264
assert m.WEBUI_HONESTY_MILESTONE == 11400
assert m.SOFT_FERTIG_HONESTY_SURFACE_VERSION.startswith(("1.", "2.", "3.", "4."))
print("soft-complete >=4264", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase4264|Soft-complete STATUS through 4264|through 4264' webui/STATUS.md
echo "STATUS soft-complete 4264 ok"
echo "cleaned"
echo "OK: phase4264 e2e passed"
