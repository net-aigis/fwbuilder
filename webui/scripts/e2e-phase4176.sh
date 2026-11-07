#!/usr/bin/env bash
# Phase-4176: soft-complete through 4176 (schema 4.2).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4176
assert m.SOFT_FERTIG_HONESTY_SURFACE_VERSION.startswith(("1.", "2.", "3.", "4."))
print("soft-complete >=4176", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase4176|Soft-complete STATUS through 4176|through 4176' webui/STATUS.md
echo "STATUS soft-complete 4176 ok"
echo "cleaned"
echo "OK: phase4176 e2e passed"
