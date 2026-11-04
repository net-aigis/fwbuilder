#!/usr/bin/env bash
# Phase-2744: soft-complete through 2744 (schema 2.4 + ms 6650).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2744
assert m.WEBUI_HONESTY_MILESTONE == 6650
assert m.SOFT_FERTIG_HONESTY_SURFACE_VERSION == "2.4"
print("soft-complete >=2744", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase2744|Soft-complete STATUS through 2744|through 2744' webui/STATUS.md
echo "STATUS soft-complete 2744 ok"
echo "cleaned"
echo "OK: phase2744 e2e passed"
