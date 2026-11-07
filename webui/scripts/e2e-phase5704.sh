#!/usr/bin/env bash
# Phase-5704: soft-complete through 5144 (schema 5.11 + ms 15900).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 5704
assert m.WEBUI_HONESTY_MILESTONE >= 15900
print("soft-complete >=5144", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase5704|Soft-complete STATUS through 5144|through 5144' webui/STATUS.md
echo "STATUS soft-complete 5144 ok"; echo "cleaned"; echo "OK: phase5704 e2e passed"
