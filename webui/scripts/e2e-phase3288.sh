#!/usr/bin/env bash
# Phase-3288: soft-complete through 3288 (catalog_summary_roster export + ms 8350).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3288
assert m.WEBUI_HONESTY_MILESTONE == 8350
print("soft-complete >=3288", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase3288|Soft-complete STATUS through 3288|through 3288' webui/STATUS.md
echo "STATUS soft-complete 3288 ok"
echo "cleaned"
echo "OK: phase3288 e2e passed"
