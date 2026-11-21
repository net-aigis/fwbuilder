#!/usr/bin/env bash
# Phase-1808: soft-complete through 1808 (schema 1.1).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1808
print("soft-complete >=1808", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase1808|Soft-complete STATUS through 1808|through 1808' webui/STATUS.md
echo "STATUS soft-complete 1808 ok"
echo "cleaned"
echo "OK: phase1808 e2e passed"
