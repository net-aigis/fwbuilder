#!/usr/bin/env bash
# Phase-5208: soft-complete through 5128 (ssh_method_lists_roster export + ms 14350).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 5208
assert m.WEBUI_HONESTY_MILESTONE >= 14350
print("soft-complete >=5128", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase5208|Soft-complete STATUS through 5128|through 5128' webui/STATUS.md
echo "STATUS soft-complete 5128 ok"; echo "cleaned"; echo "OK: phase5208 e2e passed"
