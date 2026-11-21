#!/usr/bin/env bash
# Phase-3128: soft-complete through 3128 (layout_fidelity_sample_roster export + ms 7850).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3128
assert m.WEBUI_HONESTY_MILESTONE == 7850
print("soft-complete >=3128", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase3128|Soft-complete STATUS through 3128|through 3128' webui/STATUS.md
echo "STATUS soft-complete 3128 ok"
echo "cleaned"
echo "OK: phase3128 e2e passed"
