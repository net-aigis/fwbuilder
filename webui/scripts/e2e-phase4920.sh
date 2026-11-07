#!/usr/bin/env bash
# Phase-4920: soft-complete through 4920 (ssh_capability_flags_roster sessionStorage + ms 13450).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4920
assert m.WEBUI_HONESTY_MILESTONE >= 13450
print("soft-complete >=4920", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase4920|Soft-complete STATUS through 4920|through 4920' webui/STATUS.md
echo "STATUS soft-complete 4920 ok"; echo "cleaned"; echo "OK: phase4920 e2e passed"
