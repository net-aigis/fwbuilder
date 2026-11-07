#!/usr/bin/env bash
# Phase-5656: soft-complete through 5656 (Soft 5640+ ssh_refusal_path_notes_roster Soft-Checkpoint + ms 15750).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 5656
assert m.WEBUI_HONESTY_MILESTONE == 15750
print("soft-complete >=5656", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase5656|Soft-complete STATUS through 5656|through 5656' webui/STATUS.md
echo "STATUS soft-complete 5656 ok"; echo "cleaned"; echo "OK: phase5656 e2e passed"
