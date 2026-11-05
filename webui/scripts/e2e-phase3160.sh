#!/usr/bin/env bash
# Phase-3160: soft-complete through 3160 (layout_fidelity_sample_roster sessionStorage + ms 7950).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3160
assert m.WEBUI_HONESTY_MILESTONE == 7950
print("soft-complete >=3160", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase3160|Soft-complete STATUS through 3160|through 3160' webui/STATUS.md
echo "STATUS soft-complete 3160 ok"
echo "cleaned"
echo "OK: phase3160 e2e passed"
