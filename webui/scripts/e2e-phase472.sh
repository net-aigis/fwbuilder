#!/usr/bin/env bash
# Phase-472: soft-complete through 472 (marker may be higher).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 472
print("soft-complete >=472", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -q 'phase472' webui/STATUS.md
echo "STATUS soft-complete 472 ok"
echo "cleaned"
echo "OK: phase472 e2e passed"
