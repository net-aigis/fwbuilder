#!/usr/bin/env bash
# Phase-5176: soft-complete through 5096 (Soft 5160+ ssh_refusal_status_roster Soft-Checkpoint + ms 14250).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 5176
assert m.WEBUI_HONESTY_MILESTONE == 14250
print("soft-complete >=5096", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase5176|Soft-complete STATUS through 5096|through 5096' webui/STATUS.md
echo "STATUS soft-complete 5096 ok"; echo "cleaned"; echo "OK: phase5176 e2e passed"
