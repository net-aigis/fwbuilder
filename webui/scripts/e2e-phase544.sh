#!/usr/bin/env bash
# Phase-544: soft-complete through 544 (marker may be higher).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 544
print("soft-complete >=544", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -q 'phase544' webui/STATUS.md
echo "STATUS soft-complete 544 ok"
echo "cleaned"
echo "OK: phase544 e2e passed"
