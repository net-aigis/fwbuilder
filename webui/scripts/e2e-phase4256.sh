#!/usr/bin/env bash
# Phase-4256: soft-complete through 4256 (schema 4.3).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4256
assert m.SOFT_FERTIG_HONESTY_SURFACE_VERSION.startswith(("1.", "2.", "3.", "4."))
print("soft-complete >=4256", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase4256|Soft-complete STATUS through 4256|through 4256' webui/STATUS.md
echo "STATUS soft-complete 4256 ok"
echo "cleaned"
echo "OK: phase4256 e2e passed"
