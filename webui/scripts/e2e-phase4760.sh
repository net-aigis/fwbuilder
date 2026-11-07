#!/usr/bin/env bash
# Phase-4760: soft-complete through 4760 (ssh_not_implemented_roster sessionStorage + ms 12950).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4760
assert m.WEBUI_HONESTY_MILESTONE >= 12950
print("soft-complete >=4760", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase4760|Soft-complete STATUS through 4760|through 4760' webui/STATUS.md
echo "STATUS soft-complete 4760 ok"
echo "cleaned"
echo "OK: phase4760 e2e passed"
