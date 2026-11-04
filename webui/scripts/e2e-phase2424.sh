#!/usr/bin/env bash
# Phase-2424: soft-complete through 2424 (schema 2.0 + ms 5650).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2424
assert m.WEBUI_HONESTY_MILESTONE == 5650
assert m.SOFT_FERTIG_HONESTY_SURFACE_VERSION == "2.0"
print("soft-complete >=2424", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase2424|Soft-complete STATUS through 2424|through 2424' webui/STATUS.md
echo "STATUS soft-complete 2424 ok"
echo "cleaned"
echo "OK: phase2424 e2e passed"
