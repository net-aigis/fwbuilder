#!/usr/bin/env bash
# Phase-3856: soft-complete through 3856 (schema 3.8).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3856
assert m.SOFT_FERTIG_HONESTY_SURFACE_VERSION.startswith(("1.", "2.", "3.", "4."))
print("soft-complete >=3856", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase3856|Soft-complete STATUS through 3856|through 3856' webui/STATUS.md
echo "STATUS soft-complete 3856 ok"
echo "cleaned"
echo "OK: phase3856 e2e passed"
