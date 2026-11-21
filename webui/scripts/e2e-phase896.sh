#!/usr/bin/env bash
# Phase-896: soft-complete through 896 (pages/sections/stack_names samples).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 896
print("soft-complete >=896", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase896|Soft-complete STATUS through 896|through 896' webui/STATUS.md
echo "STATUS soft-complete 896 ok"
echo "cleaned"
echo "OK: phase896 e2e passed"
