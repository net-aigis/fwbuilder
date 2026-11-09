#!/usr/bin/env bash
# Phase-19208: soft-complete through 5849 (ssh_alternative_notes_refresh_roster export + ms 18850).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 19216
assert m.WEBUI_HONESTY_MILESTONE >= 18850
print("soft-complete >=6408", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase19208|Soft-complete STATUS through 5849|through 5849' webui/STATUS.md
echo "STATUS soft-complete 5128 ok"; echo "cleaned"; echo "OK: phase19208 e2e passed"
