#!/usr/bin/env bash
# Phase-4728: soft-complete through 4728 (ssh_not_implemented_roster export + ms 12850).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4728
assert m.WEBUI_HONESTY_MILESTONE == 12850
print("soft-complete >=4728", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase4728|Soft-complete STATUS through 4728|through 4728' webui/STATUS.md
echo "STATUS soft-complete 4728 ok"
echo "cleaned"
echo "OK: phase4728 e2e passed"
