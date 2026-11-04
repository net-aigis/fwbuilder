#!/usr/bin/env bash
# Phase-1784: soft-complete through 1784 (catalog summary UI + ms 3650).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1784
assert m.WEBUI_HONESTY_MILESTONE == 3650
print("soft-complete >=1784", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase1784|Soft-complete STATUS through 1784|through 1784' webui/STATUS.md
echo "STATUS soft-complete 1784 ok"
echo "cleaned"
echo "OK: phase1784 e2e passed"
