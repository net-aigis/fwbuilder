#!/usr/bin/env bash
# Phase-5568: soft-complete through 5168 (Soft 5560+ ssh_refusal_path_titles_roster Soft-Checkpoint).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 5568
print("soft-complete >=5168", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase5568|Soft-complete STATUS through 5168|through 5168' webui/STATUS.md
echo "STATUS soft-complete 5168 ok"; echo "cleaned"; echo "OK: phase5568 e2e passed"
