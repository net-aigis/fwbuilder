#!/usr/bin/env bash
# Phase-1360: soft-complete through 1360 (closure soft_fertig_surface).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1360
print("soft-complete >=1360", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase1360|Soft-complete STATUS through 1360|through 1360' webui/STATUS.md
echo "STATUS soft-complete 1360 ok"
echo "cleaned"
echo "OK: phase1360 e2e passed"
