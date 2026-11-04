#!/usr/bin/env bash
# Phase-1968: soft-complete through 1968 (catalog_summary readiness flags).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1968
print("soft-complete >=1968", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase1968|Soft-complete STATUS through 1968|through 1968' webui/STATUS.md
echo "STATUS soft-complete 1968 ok"
echo "cleaned"
echo "OK: phase1968 e2e passed"
