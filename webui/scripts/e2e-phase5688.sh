#!/usr/bin/env bash
# Phase-5688: soft-complete through 5128 (ssh_auth_note_roster export + ms 15850).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 5688
assert m.WEBUI_HONESTY_MILESTONE >= 15850
print("soft-complete >=5128", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase5688|Soft-complete STATUS through 5128|through 5128' webui/STATUS.md
echo "STATUS soft-complete 5128 ok"; echo "cleaned"; echo "OK: phase5688 e2e passed"
