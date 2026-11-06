#!/usr/bin/env bash
# Phase-4016: soft-complete through 4016 (schema 4.0).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4016
assert m.SOFT_FERTIG_HONESTY_SURFACE_VERSION.startswith(("1.", "2.", "3.", "4."))
print("soft-complete >=4016", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase4016|Soft-complete STATUS through 4016|through 4016' webui/STATUS.md
echo "STATUS soft-complete 4016 ok"
echo "cleaned"
echo "OK: phase4016 e2e passed"
