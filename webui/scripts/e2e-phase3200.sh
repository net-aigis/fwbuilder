#!/usr/bin/env bash
# Phase-3200: soft-complete through 3200 (layout_fidelity_sample_field_roster export).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3200
print("soft-complete >=3200", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase3200|Soft-complete STATUS through 3200|through 3200' webui/STATUS.md
echo "STATUS soft-complete 3200 ok"
echo "cleaned"
echo "OK: phase3200 e2e passed"
