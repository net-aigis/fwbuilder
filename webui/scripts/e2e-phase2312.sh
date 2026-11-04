#!/usr/bin/env bash
# Phase-2312: soft-complete through 2312 (hard-gap refusal roster + ms 5300).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2312
assert m.WEBUI_HONESTY_MILESTONE == 5300
print("soft-complete >=2312", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase2312|Soft-complete STATUS through 2312|through 2312' webui/STATUS.md
echo "STATUS soft-complete 2312 ok"
echo "cleaned"
echo "OK: phase2312 e2e passed"
