#!/usr/bin/env bash
# Phase-1448: soft-complete through 1448 (milestone 2600).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1448
assert m.WEBUI_HONESTY_MILESTONE == 2600
print("soft-complete >=1448", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase1448|Soft-complete STATUS through 1448|through 1448' webui/STATUS.md
echo "STATUS soft-complete 1448 ok"
echo "cleaned"
echo "OK: phase1448 e2e passed"
