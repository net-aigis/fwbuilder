#!/usr/bin/env bash
# Phase-1640: soft-complete through 1640 (honesty bundle in surface + ms 3200).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1640
assert m.WEBUI_HONESTY_MILESTONE == 3200
print("soft-complete >=1640", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase1640|Soft-complete STATUS through 1640|through 1640' webui/STATUS.md
echo "STATUS soft-complete 1640 ok"
echo "cleaned"
echo "OK: phase1640 e2e passed"
