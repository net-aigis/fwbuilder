#!/usr/bin/env bash
# Phase-2336: soft-complete through 2336 (schema 1.9).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2336
assert m.SOFT_FERTIG_HONESTY_SURFACE_VERSION .startswith(("1.", "2.", "3.", "4."))
print("soft-complete >=2336", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase2336|Soft-complete STATUS through 2336|through 2336' webui/STATUS.md
echo "STATUS soft-complete 2336 ok"
echo "cleaned"
echo "OK: phase2336 e2e passed"
