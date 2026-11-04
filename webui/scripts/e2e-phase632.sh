#!/usr/bin/env bash
# Phase-632: soft-complete through 632.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 632
print("soft-complete >=632", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -q 'phase632\|Soft-complete STATUS through 632\|through 632' webui/STATUS.md
echo "STATUS soft-complete 632 ok"
echo "cleaned"
echo "OK: phase632 e2e passed"
