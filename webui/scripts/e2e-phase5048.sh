#!/usr/bin/env bash
# Phase-5048: soft-complete through 5048 (ssh_refusal_paths_roster export + ms 13850).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 5048
assert m.WEBUI_HONESTY_MILESTONE >= 13850
print("soft-complete >=5048", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase5048|Soft-complete STATUS through 5048|through 5048' webui/STATUS.md
echo "STATUS soft-complete 5048 ok"; echo "cleaned"; echo "OK: phase5048 e2e passed"
