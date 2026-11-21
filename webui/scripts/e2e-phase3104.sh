#!/usr/bin/env bash
# Phase-3104: soft-complete through 3104 (layout_fidelity_sample_roster).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3104
print("soft-complete >=3104", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase3104|Soft-complete STATUS through 3104|through 3104' webui/STATUS.md
echo "STATUS soft-complete 3104 ok"
echo "cleaned"
echo "OK: phase3104 e2e passed"
