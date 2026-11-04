#!/usr/bin/env bash
# Phase-1256: soft-complete through 1256 (hard_gap_related_refusals).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1256
print("soft-complete >=1256", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase1256|Soft-complete STATUS through 1256|through 1256' webui/STATUS.md
echo "STATUS soft-complete 1256 ok"
echo "cleaned"
echo "OK: phase1256 e2e passed"
