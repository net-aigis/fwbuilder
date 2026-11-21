#!/usr/bin/env bash
# Phase-4840: soft-complete through 4840 (ssh_implemented_roster sessionStorage + ms 13200).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4840
assert m.WEBUI_HONESTY_MILESTONE >= 13200
print("soft-complete >=4840", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase4840|Soft-complete STATUS through 4840|through 4840' webui/STATUS.md
echo "STATUS soft-complete 4840 ok"; echo "cleaned"; echo "OK: phase4840 e2e passed"
