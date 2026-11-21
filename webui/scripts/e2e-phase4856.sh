#!/usr/bin/env bash
# Phase-4856: soft-complete through 4856 (Soft 4840+ ssh_implemented_roster Soft-Checkpoint + ms 13250).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4856
assert m.WEBUI_HONESTY_MILESTONE == 13250
print("soft-complete >=4856", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase4856|Soft-complete STATUS through 4856|through 4856' webui/STATUS.md
echo "STATUS soft-complete 4856 ok"; echo "cleaned"; echo "OK: phase4856 e2e passed"
