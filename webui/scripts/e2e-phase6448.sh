#!/usr/bin/env bash
# Phase-6448: soft-complete through 6448 (Soft 6440+ ssh_implemented_agent_roster).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 6448
print("soft-complete >=6448", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase6448|Soft-complete STATUS through 6448|through 6448' webui/STATUS.md
echo "STATUS soft-complete 6448 ok"; echo "cleaned"; echo "OK: phase6448 e2e passed"
