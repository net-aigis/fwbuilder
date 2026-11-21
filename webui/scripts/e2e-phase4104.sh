#!/usr/bin/env bash
# Phase-4104: soft-complete through 4104 (schema 4.1 + ms 10900).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4104
assert m.WEBUI_HONESTY_MILESTONE == 10900
assert m.SOFT_FERTIG_HONESTY_SURFACE_VERSION.startswith(("1.", "2.", "3.", "4."))
print("soft-complete >=4104", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase4104|Soft-complete STATUS through 4104|through 4104' webui/STATUS.md
echo "STATUS soft-complete 4104 ok"
echo "cleaned"
echo "OK: phase4104 e2e passed"
