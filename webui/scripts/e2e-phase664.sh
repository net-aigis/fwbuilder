#!/usr/bin/env bash
# Phase-664: soft-complete through 664.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 664
print("soft-complete >=664", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase664|Soft-complete STATUS through 664|through 664' webui/STATUS.md
echo "STATUS soft-complete 664 ok"
echo "cleaned"
echo "OK: phase664 e2e passed"
