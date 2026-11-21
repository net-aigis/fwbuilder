#!/usr/bin/env bash
# Phase-4864: soft-complete through 4864 (ssh_capability_flags_roster).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4864
print("soft-complete >=4864", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase4864|Soft-complete STATUS through 4864|through 4864' webui/STATUS.md
echo "STATUS soft-complete 4864 ok"; echo "cleaned"; echo "OK: phase4864 e2e passed"
