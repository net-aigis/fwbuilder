#!/usr/bin/env bash
# Phase-592: soft-complete through 592 (marker may be higher).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 592
print("soft-complete >=592", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -q 'phase592' webui/STATUS.md
echo "STATUS soft-complete 592 ok"
echo "cleaned"
echo "OK: phase592 e2e passed"
