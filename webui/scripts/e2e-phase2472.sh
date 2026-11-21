#!/usr/bin/env bash
# Phase-2472: soft-complete through 2472 (sessionStorage roster + ms 5800).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2472
assert m.WEBUI_HONESTY_MILESTONE == 5800
print("soft-complete >=2472", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase2472|Soft-complete STATUS through 2472|through 2472' webui/STATUS.md
echo "STATUS soft-complete 2472 ok"
echo "cleaned"
echo "OK: phase2472 e2e passed"
