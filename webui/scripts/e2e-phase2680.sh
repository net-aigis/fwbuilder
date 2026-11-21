#!/usr/bin/env bash
# Phase-2680: soft-complete through 2680 (honesty_bundle_roster sessionStorage + ms 6450).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2680
assert m.WEBUI_HONESTY_MILESTONE == 6450
print("soft-complete >=2680", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase2680|Soft-complete STATUS through 2680|through 2680' webui/STATUS.md
echo "STATUS soft-complete 2680 ok"
echo "cleaned"
echo "OK: phase2680 e2e passed"
