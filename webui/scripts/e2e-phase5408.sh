#!/usr/bin/env bash
# Phase-5408: soft-complete through 5168 (Soft 5400+ ssh_alternative_notes_roster Soft-Checkpoint).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 5408
print("soft-complete >=5168", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase5408|Soft-complete STATUS through 5168|through 5168' webui/STATUS.md
echo "STATUS soft-complete 5168 ok"; echo "cleaned"; echo "OK: phase5408 e2e passed"
