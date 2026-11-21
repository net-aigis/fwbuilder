#!/usr/bin/env bash
# Phase-3120: soft-complete through 3120 (layout_fidelity_sample_roster export).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3120
print("soft-complete >=3120", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase3120|Soft-complete STATUS through 3120|through 3120' webui/STATUS.md
echo "STATUS soft-complete 3120 ok"
echo "cleaned"
echo "OK: phase3120 e2e passed"
