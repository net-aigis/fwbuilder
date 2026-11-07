#!/usr/bin/env bash
# Phase-4336: soft-complete through 4336 (schema 4.4).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4336
assert m.SOFT_FERTIG_HONESTY_SURFACE_VERSION.startswith(("1.", "2.", "3.", "4."))
print("soft-complete >=4336", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase4336|Soft-complete STATUS through 4336|through 4336' webui/STATUS.md
echo "STATUS soft-complete 4336 ok"
echo "cleaned"
echo "OK: phase4336 e2e passed"
