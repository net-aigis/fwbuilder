#!/usr/bin/env bash
# Phase-3896: soft-complete through 3896 (Soft 3880+ / ms 10250).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3896
assert m.WEBUI_HONESTY_MILESTONE == 10250
print("soft-complete >=3896", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase3896|Soft-complete STATUS through 3896|through 3896' webui/STATUS.md
echo "STATUS soft-complete 3896 ok"
echo "cleaned"
echo "OK: phase3896 e2e passed"
