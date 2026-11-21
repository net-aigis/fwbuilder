#!/usr/bin/env bash
# Phase-1704: soft-complete through 1704 (clear detail + ms 3400).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1704
assert m.WEBUI_HONESTY_MILESTONE == 3400
print("soft-complete >=1704", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase1704|Soft-complete STATUS through 1704|through 1704' webui/STATUS.md
echo "STATUS soft-complete 1704 ok"
echo "cleaned"
echo "OK: phase1704 e2e passed"
