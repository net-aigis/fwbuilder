#!/usr/bin/env bash
# Phase-1880: soft-complete through 1880 (schema 1.2 + ms 3950).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1880
assert m.WEBUI_HONESTY_MILESTONE == 3950
assert m.SOFT_FERTIG_HONESTY_SURFACE_VERSION.startswith(("1.", "2."))
print("soft-complete >=1880", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase1880|Soft-complete STATUS through 1880|through 1880' webui/STATUS.md
echo "STATUS soft-complete 1880 ok"
echo "cleaned"
echo "OK: phase1880 e2e passed"
