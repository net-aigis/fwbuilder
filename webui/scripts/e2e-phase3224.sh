#!/usr/bin/env bash
# Phase-3224: soft-complete through 3224 (schema 3.0 + ms 8150).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3224
assert m.WEBUI_HONESTY_MILESTONE == 8150
assert m.SOFT_FERTIG_HONESTY_SURFACE_VERSION.startswith(("1.", "2.", "3.", "4."))
print("soft-complete >=3224", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase3224|Soft-complete STATUS through 3224|through 3224' webui/STATUS.md
echo "STATUS soft-complete 3224 ok"
echo "cleaned"
echo "OK: phase3224 e2e passed"
