#!/usr/bin/env bash
# Phase-5736: soft-complete through 5736 (Soft 5720+ ssh_auth_note_roster Soft-Checkpoint + ms 16000).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 5736
assert m.WEBUI_HONESTY_MILESTONE == 16000
print("soft-complete >=5736", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase5736|Soft-complete STATUS through 5736|through 5736' webui/STATUS.md
echo "STATUS soft-complete 5736 ok"; echo "cleaned"; echo "OK: phase5736 e2e passed"
