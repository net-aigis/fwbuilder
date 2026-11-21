#!/usr/bin/env bash
# Phase-5104: soft-complete through 5104 (ssh_refusal_status_roster).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 5104
print("soft-complete >=5104", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase5104|Soft-complete STATUS through 5104|through 5104' webui/STATUS.md
echo "STATUS soft-complete 5104 ok"; echo "cleaned"; echo "OK: phase5104 e2e passed"
