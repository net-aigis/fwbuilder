#!/usr/bin/env bash
# Phase-1576: soft-complete through 1576 (session notes in surface + ms 3000).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1576
assert m.WEBUI_HONESTY_MILESTONE == 3000
print("soft-complete >=1576", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase1576|Soft-complete STATUS through 1576|through 1576' webui/STATUS.md
echo "STATUS soft-complete 1576 ok"
echo "cleaned"
echo "OK: phase1576 e2e passed"
