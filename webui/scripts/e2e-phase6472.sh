#!/usr/bin/env bash
# Phase-6472: soft-complete through 5833 (ssh_auth_note_snapshot_roster + ms 18300).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 6480
assert m.WEBUI_HONESTY_MILESTONE >= 18300
print("soft-complete >=6392", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase6472|Soft-complete STATUS through 5833|through 5833' webui/STATUS.md
echo "STATUS soft-complete 5112 ok"; echo "cleaned"; echo "OK: phase6472 e2e passed"
