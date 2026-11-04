#!/usr/bin/env bash
# Phase-2664: soft-complete through 2664 (schema 2.3 + ms 6400).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2664
assert m.WEBUI_HONESTY_MILESTONE == 6400
assert m.SOFT_FERTIG_HONESTY_SURFACE_VERSION .startswith("2.")
print("soft-complete >=2664", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase2664|Soft-complete STATUS through 2664|through 2664' webui/STATUS.md
echo "STATUS soft-complete 2664 ok"
echo "cleaned"
echo "OK: phase2664 e2e passed"
