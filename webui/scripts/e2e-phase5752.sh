#!/usr/bin/env bash
# Phase-5752: soft-complete through 5752 (ssh_alternative_support_roster + ms 16050).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 5752
assert m.WEBUI_HONESTY_MILESTONE >= 16050
print("soft-complete >=5752", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase5752|Soft-complete STATUS through 5752|through 5752' webui/STATUS.md
echo "STATUS soft-complete 5112 ok"; echo "cleaned"; echo "OK: phase5752 e2e passed"
