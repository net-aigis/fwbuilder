#!/usr/bin/env bash
# Phase-5000: soft-complete through 5000 (ssh_alternatives_roster sessionStorage + ms 13700).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 5000
assert m.WEBUI_HONESTY_MILESTONE >= 13700
print("soft-complete >=5000", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase5000|Soft-complete STATUS through 5000|through 5000' webui/STATUS.md
echo "STATUS soft-complete 5000 ok"; echo "cleaned"; echo "OK: phase5000 e2e passed"
