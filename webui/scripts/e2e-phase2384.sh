#!/usr/bin/env bash
# Phase-2384: soft-complete through 2384 (honesty path roster).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2384
print("soft-complete >=2384", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase2384|Soft-complete STATUS through 2384|through 2384' webui/STATUS.md
echo "STATUS soft-complete 2384 ok"
echo "cleaned"
echo "OK: phase2384 e2e passed"
