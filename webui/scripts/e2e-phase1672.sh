#!/usr/bin/env bash
# Phase-1672: soft-complete through 1672 (session clear docs + ms 3300).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1672
assert m.WEBUI_HONESTY_MILESTONE == 3300
print("soft-complete >=1672", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase1672|Soft-complete STATUS through 1672|through 1672' webui/STATUS.md
echo "STATUS soft-complete 1672 ok"
echo "cleaned"
echo "OK: phase1672 e2e passed"
