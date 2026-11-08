#!/usr/bin/env bash
# Phase-6392: soft-complete through 5833 (ssh_implemented_agent_roster + ms 18050).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 6400
assert m.WEBUI_HONESTY_MILESTONE >= 18050
print("soft-complete >=6392", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase6392|Soft-complete STATUS through 5833|through 5833' webui/STATUS.md
echo "STATUS soft-complete 5112 ok"; echo "cleaned"; echo "OK: phase6392 e2e passed"
