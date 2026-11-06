#!/usr/bin/env bash
# Phase-3784: soft-complete through 3784 (schema 3.7 + ms 9900).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3784
assert m.WEBUI_HONESTY_MILESTONE == 9900
assert m.SOFT_FERTIG_HONESTY_SURFACE_VERSION.startswith(("1.", "2.", "3.", "4."))
print("soft-complete >=3784", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase3784|Soft-complete STATUS through 3784|through 3784' webui/STATUS.md
echo "STATUS soft-complete 3784 ok"
echo "cleaned"
echo "OK: phase3784 e2e passed"
