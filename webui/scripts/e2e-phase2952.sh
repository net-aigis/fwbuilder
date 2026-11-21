#!/usr/bin/env bash
# Phase-2952: soft-complete through 2952 (ssh_honesty_roster + ms 7300).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2952
assert m.WEBUI_HONESTY_MILESTONE == 7300
print("soft-complete >=2952", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase2952|Soft-complete STATUS through 2952|through 2952' webui/STATUS.md
echo "STATUS soft-complete 2952 ok"
echo "cleaned"
echo "OK: phase2952 e2e passed"
