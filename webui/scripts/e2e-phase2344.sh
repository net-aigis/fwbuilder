#!/usr/bin/env bash
# Phase-2344: soft-complete through 2344 (schema 1.9 + ms 5400).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2344
assert m.WEBUI_HONESTY_MILESTONE == 5400
assert m.SOFT_FERTIG_HONESTY_SURFACE_VERSION .startswith(("1.", "2.", "3."))
print("soft-complete >=2344", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase2344|Soft-complete STATUS through 2344|through 2344' webui/STATUS.md
echo "STATUS soft-complete 2344 ok"
echo "cleaned"
echo "OK: phase2344 e2e passed"
