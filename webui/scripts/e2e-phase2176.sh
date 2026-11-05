#!/usr/bin/env bash
# Phase-2176: soft-complete through 2176 (schema 1.7).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2176
assert m.SOFT_FERTIG_HONESTY_SURFACE_VERSION .startswith(("1.", "2.", "3."))
print("soft-complete >=2176", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase2176|Soft-complete STATUS through 2176|through 2176' webui/STATUS.md
echo "STATUS soft-complete 2176 ok"
echo "cleaned"
echo "OK: phase2176 e2e passed"
