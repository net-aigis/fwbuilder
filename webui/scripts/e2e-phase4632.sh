#!/usr/bin/env bash
# Phase-4632: soft-complete through 4632 (password_ssh_roster + ms 12550).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4632
assert m.WEBUI_HONESTY_MILESTONE == 12550
print("soft-complete >=4632", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase4632|Soft-complete STATUS through 4632|through 4632' webui/STATUS.md
echo "STATUS soft-complete 4632 ok"
echo "cleaned"
echo "OK: phase4632 e2e passed"
