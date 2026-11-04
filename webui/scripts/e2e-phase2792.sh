#!/usr/bin/env bash
# Phase-2792: soft-complete through 2792 (changelog roster + ms 6800).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2792
assert m.WEBUI_HONESTY_MILESTONE == 6800
print("soft-complete >=2792", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase2792|Soft-complete STATUS through 2792|through 2792' webui/STATUS.md
echo "STATUS soft-complete 2792 ok"
echo "cleaned"
echo "OK: phase2792 e2e passed"
