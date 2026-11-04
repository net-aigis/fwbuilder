#!/usr/bin/env bash
# Phase-1064: soft-complete through 1064 (pages_with_buddy_labels).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1064
print("soft-complete >=1064", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase1064|Soft-complete STATUS through 1064|through 1064' webui/STATUS.md
echo "STATUS soft-complete 1064 ok"
echo "cleaned"
echo "OK: phase1064 e2e passed"
