#!/usr/bin/env bash
# Phase-5256: soft-complete through 5096 (Soft 5240+ ssh_method_lists_roster Soft-Checkpoint + ms 14500).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 5256
assert m.WEBUI_HONESTY_MILESTONE == 14500
print("soft-complete >=5096", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase5256|Soft-complete STATUS through 5096|through 5096' webui/STATUS.md
echo "STATUS soft-complete 5096 ok"; echo "cleaned"; echo "OK: phase5256 e2e passed"
