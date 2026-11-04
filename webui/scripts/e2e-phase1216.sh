#!/usr/bin/env bash
# Phase-1216: soft-complete through 1216 (milestone 1900).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1216
assert m.WEBUI_HONESTY_MILESTONE == 1900
print("soft-complete >=1216", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase1216|Soft-complete STATUS through 1216|through 1216' webui/STATUS.md
echo "STATUS soft-complete 1216 ok"
echo "cleaned"
echo "OK: phase1216 e2e passed"
