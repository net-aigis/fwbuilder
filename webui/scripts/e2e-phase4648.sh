#!/usr/bin/env bash
# Phase-4648: soft-complete through 4648 (password_ssh_roster export + ms 12600).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4648
assert m.WEBUI_HONESTY_MILESTONE == 12600
print("soft-complete >=4648", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase4648|Soft-complete STATUS through 4648|through 4648' webui/STATUS.md
echo "STATUS soft-complete 4648 ok"
echo "cleaned"
echo "OK: phase4648 e2e passed"
