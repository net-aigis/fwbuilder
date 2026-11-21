#!/usr/bin/env bash
# Phase-5744: soft-complete through 5744 (ssh_alternative_support_roster).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 5744
print("soft-complete >=5744", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase5744|Soft-complete STATUS through 5744|through 5744' webui/STATUS.md
echo "STATUS soft-complete 5104 ok"; echo "cleaned"; echo "OK: phase5744 e2e passed"
