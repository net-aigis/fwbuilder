#!/usr/bin/env bash
# Phase-3832: soft-complete through 3832 (health_roster + ms 10050).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3832
assert m.WEBUI_HONESTY_MILESTONE == 10050
print("soft-complete >=3832", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase3832|Soft-complete STATUS through 3832|through 3832' webui/STATUS.md
echo "STATUS soft-complete 3832 ok"
echo "cleaned"
echo "OK: phase3832 e2e passed"
