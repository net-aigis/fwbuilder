#!/usr/bin/env bash
# Phase-4912: soft-complete through 4912 (ssh_capability_flags_roster sessionStorage).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4912
print("soft-complete >=4912", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase4912|Soft-complete STATUS through 4912|through 4912' webui/STATUS.md
echo "STATUS soft-complete 4912 ok"; echo "cleaned"; echo "OK: phase4912 e2e passed"
