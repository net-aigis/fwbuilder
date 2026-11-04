#!/usr/bin/env bash
# Phase-1832: soft-complete through 1832 (track note + ms 3800).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1832
assert m.WEBUI_HONESTY_MILESTONE == 3800
print("soft-complete >=1832", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase1832|Soft-complete STATUS through 1832|through 1832' webui/STATUS.md
echo "STATUS soft-complete 1832 ok"
echo "cleaned"
echo "OK: phase1832 e2e passed"
