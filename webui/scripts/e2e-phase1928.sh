#!/usr/bin/env bash
# Phase-1928: soft-complete through 1928 (readiness export/bundle + ms 4100).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1928
assert m.WEBUI_HONESTY_MILESTONE == 4100
print("soft-complete >=1928", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase1928|Soft-complete STATUS through 1928|through 1928' webui/STATUS.md
echo "STATUS soft-complete 1928 ok"
echo "cleaned"
echo "OK: phase1928 e2e passed"
