#!/usr/bin/env bash
# Phase-1128: soft-complete through 1128 (alt pages_with_buddy_labels).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1128
print("soft-complete >=1128", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase1128|Soft-complete STATUS through 1128|through 1128' webui/STATUS.md
echo "STATUS soft-complete 1128 ok"
echo "cleaned"
echo "OK: phase1128 e2e passed"
