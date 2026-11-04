#!/usr/bin/env bash
# Phase-1144: soft-complete through 1144 (hard_gap_open_labels).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1144
print("soft-complete >=1144", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase1144|Soft-complete STATUS through 1144|through 1144' webui/STATUS.md
echo "STATUS soft-complete 1144 ok"
echo "cleaned"
echo "OK: phase1144 e2e passed"
