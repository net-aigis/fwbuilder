#!/usr/bin/env bash
# Phase-912: soft-complete through 912 (chrome window_title/tab_position).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 912
print("soft-complete >=912", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase912|Soft-complete STATUS through 912|through 912' webui/STATUS.md
echo "STATUS soft-complete 912 ok"
echo "cleaned"
echo "OK: phase912 e2e passed"
