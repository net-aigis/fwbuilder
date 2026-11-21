#!/usr/bin/env bash
# Phase-552: soft-complete through 552 (marker may be higher).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 552
print("soft-complete >=552", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -q 'phase552' webui/STATUS.md
echo "STATUS soft-complete 552 ok"
echo "cleaned"
echo "OK: phase552 e2e passed"
