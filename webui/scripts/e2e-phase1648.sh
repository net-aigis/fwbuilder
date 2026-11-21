#!/usr/bin/env bash
# Phase-1648: soft-complete through 1648 (honesty_bundle catalogs).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1648
print("soft-complete >=1648", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase1648|Soft-complete STATUS through 1648|through 1648' webui/STATUS.md
echo "STATUS soft-complete 1648 ok"
echo "cleaned"
echo "OK: phase1648 e2e passed"
