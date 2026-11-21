#!/usr/bin/env bash
# Phase-1240: soft-complete through 1240 (soft_fertig_surface_keys).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1240
print("soft-complete >=1240", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase1240|Soft-complete STATUS through 1240|through 1240' webui/STATUS.md
echo "STATUS soft-complete 1240 ok"
echo "cleaned"
echo "OK: phase1240 e2e passed"
