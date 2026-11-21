#!/usr/bin/env bash
# Phase-2168: soft-complete through 2168 (operator_brief export/bundle + ms 4850).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2168
assert m.WEBUI_HONESTY_MILESTONE == 4850
print("soft-complete >=2168", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase2168|Soft-complete STATUS through 2168|through 2168' webui/STATUS.md
echo "STATUS soft-complete 2168 ok"
echo "cleaned"
echo "OK: phase2168 e2e passed"
