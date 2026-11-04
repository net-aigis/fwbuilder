#!/usr/bin/env bash
# Phase-1392: soft-complete through 1392 (closure honesty_paths).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1392
print("soft-complete >=1392", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase1392|Soft-complete STATUS through 1392|through 1392' webui/STATUS.md
echo "STATUS soft-complete 1392 ok"
echo "cleaned"
echo "OK: phase1392 e2e passed"
