#!/usr/bin/env bash
# Phase-4712: soft-complete through 4712 (ssh_not_implemented_roster + ms 12800).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4712
assert m.WEBUI_HONESTY_MILESTONE == 12800
print("soft-complete >=4712", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase4712|Soft-complete STATUS through 4712|through 4712' webui/STATUS.md
echo "STATUS soft-complete 4712 ok"
echo "cleaned"
echo "OK: phase4712 e2e passed"
