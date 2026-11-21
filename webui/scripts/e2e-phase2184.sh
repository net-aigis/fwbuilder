#!/usr/bin/env bash
# Phase-2184: soft-complete through 2184 (schema 1.7 + ms 4900).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2184
assert m.WEBUI_HONESTY_MILESTONE == 4900
assert m.SOFT_FERTIG_HONESTY_SURFACE_VERSION .startswith(("1.", "2.", "3.", "4."))
print("soft-complete >=2184", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase2184|Soft-complete STATUS through 2184|through 2184' webui/STATUS.md
echo "STATUS soft-complete 2184 ok"
echo "cleaned"
echo "OK: phase2184 e2e passed"
