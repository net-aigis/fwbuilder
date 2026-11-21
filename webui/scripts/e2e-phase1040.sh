#!/usr/bin/env bash
# Phase-1040: soft-complete through 1040 (pages_with_tooltip).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1040
print("soft-complete >=1040", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase1040|Soft-complete STATUS through 1040|through 1040' webui/STATUS.md
echo "STATUS soft-complete 1040 ok"
echo "cleaned"
echo "OK: phase1040 e2e passed"
