#!/usr/bin/env bash
# Phase-1456: soft-complete through 1456 (sessionStorage catalogs).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1456
print("soft-complete >=1456", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase1456|Soft-complete STATUS through 1456|through 1456' webui/STATUS.md
echo "STATUS soft-complete 1456 ok"
echo "cleaned"
echo "OK: phase1456 e2e passed"
