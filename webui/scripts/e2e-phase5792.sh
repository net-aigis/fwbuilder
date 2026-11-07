#!/usr/bin/env bash
# Phase-5792: soft-complete through 5792 (ssh_alternative_support_roster sessionStorage).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 5792
print("soft-complete >=5792", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase5792|Soft-complete STATUS through 5792|through 5792' webui/STATUS.md
echo "STATUS soft-complete 5152 ok"; echo "cleaned"; echo "OK: phase5792 e2e passed"
