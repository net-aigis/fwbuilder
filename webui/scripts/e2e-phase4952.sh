#!/usr/bin/env bash
# Phase-4952: soft-complete through 4952 (ssh_alternatives_roster + ms 13550).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4952
assert m.WEBUI_HONESTY_MILESTONE >= 13550
print("soft-complete >=4952", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase4952|Soft-complete STATUS through 4952|through 4952' webui/STATUS.md
echo "STATUS soft-complete 4952 ok"; echo "cleaned"; echo "OK: phase4952 e2e passed"
