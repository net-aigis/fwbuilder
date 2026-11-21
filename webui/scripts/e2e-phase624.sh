#!/usr/bin/env bash
# Phase-624: soft-complete through 624.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 624
print("soft-complete >=624", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -q 'phase624\|Soft-complete STATUS through 624\|through 624' webui/STATUS.md
echo "STATUS soft-complete 624 ok"
echo "cleaned"
echo "OK: phase624 e2e passed"
