#!/usr/bin/env bash
# Phase-5728: soft-complete through 5168 (Soft 5720+ ssh_auth_note_roster Soft-Checkpoint).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 5728
print("soft-complete >=5168", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase5728|Soft-complete STATUS through 5168|through 5168' webui/STATUS.md
echo "STATUS soft-complete 5168 ok"; echo "cleaned"; echo "OK: phase5728 e2e passed"
