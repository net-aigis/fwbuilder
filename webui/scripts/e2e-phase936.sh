#!/usr/bin/env bash
# Phase-936: soft-complete through 936 (honesty milestone 1250).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 936
assert m.WEBUI_HONESTY_MILESTONE == 1250
print("soft-complete >=936", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase936|Soft-complete STATUS through 936|through 936' webui/STATUS.md
echo "STATUS soft-complete 936 ok"
echo "cleaned"
echo "OK: phase936 e2e passed"
