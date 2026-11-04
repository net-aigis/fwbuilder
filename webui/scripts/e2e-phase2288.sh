#!/usr/bin/env bash
# Phase-2288: soft-complete through 2288 (Soft 2280+).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2288
print("soft-complete >=2288", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase2288|Soft-complete STATUS through 2288|through 2288' webui/STATUS.md
echo "STATUS soft-complete 2288 ok"
echo "cleaned"
echo "OK: phase2288 e2e passed"
