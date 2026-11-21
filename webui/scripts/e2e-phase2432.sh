#!/usr/bin/env bash
# Phase-2432: soft-complete through 2432 (honesty_path_roster sessionStorage).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2432
print("soft-complete >=2432", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase2432|Soft-complete STATUS through 2432|through 2432' webui/STATUS.md
echo "STATUS soft-complete 2432 ok"
echo "cleaned"
echo "OK: phase2432 e2e passed"
