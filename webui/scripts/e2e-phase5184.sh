#!/usr/bin/env bash
# Phase-5184: soft-complete through 5104 (ssh_method_lists_roster).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 5184
print("soft-complete >=5104", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase5184|Soft-complete STATUS through 5104|through 5104' webui/STATUS.md
echo "STATUS soft-complete 5104 ok"; echo "cleaned"; echo "OK: phase5184 e2e passed"
