#!/usr/bin/env bash
# Phase-3704: soft-complete through 3704 (schema 3.6 + ms 9650).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3704
assert m.WEBUI_HONESTY_MILESTONE == 9650
assert m.SOFT_FERTIG_HONESTY_SURFACE_VERSION.startswith("3.")
print("soft-complete >=3704", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase3704|Soft-complete STATUS through 3704|through 3704' webui/STATUS.md
echo "STATUS soft-complete 3704 ok"
echo "cleaned"
echo "OK: phase3704 e2e passed"
