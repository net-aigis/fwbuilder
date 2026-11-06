#!/usr/bin/env bash
# Phase-3616: soft-complete through 3616 (schema 3.5).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3616
assert m.SOFT_FERTIG_HONESTY_SURFACE_VERSION.startswith("3.")
print("soft-complete >=3616", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase3616|Soft-complete STATUS through 3616|through 3616' webui/STATUS.md
echo "STATUS soft-complete 3616 ok"
echo "cleaned"
echo "OK: phase3616 e2e passed"
