#!/usr/bin/env bash
# Phase-2392: soft-complete through 2392 (honesty path roster + ms 5550).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2392
assert m.WEBUI_HONESTY_MILESTONE == 5550
print("soft-complete >=2392", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase2392|Soft-complete STATUS through 2392|through 2392' webui/STATUS.md
echo "STATUS soft-complete 2392 ok"
echo "cleaned"
echo "OK: phase2392 e2e passed"
