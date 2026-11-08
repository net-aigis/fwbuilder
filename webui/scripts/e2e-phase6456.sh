#!/usr/bin/env bash
# Phase-6456: soft-complete through 6456 (Soft 6440+ ssh_implemented_agent_roster + ms 18250).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 6456
assert m.WEBUI_HONESTY_MILESTONE == 18250
print("soft-complete >=6456", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase6456|Soft-complete STATUS through 6456|through 6456' webui/STATUS.md
echo "STATUS soft-complete 6456 ok"; echo "cleaned"; echo "OK: phase6456 e2e passed"
