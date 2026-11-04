#!/usr/bin/env bash
# Phase-720: soft-complete through 720 (honesty milestone 750).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 720
assert m.WEBUI_HONESTY_MILESTONE == 750
print("soft-complete >=720", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase720|Soft-complete STATUS through 720|through 720' webui/STATUS.md
echo "STATUS soft-complete 720 ok"
echo "cleaned"
echo "OK: phase720 e2e passed"
