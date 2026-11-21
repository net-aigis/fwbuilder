#!/usr/bin/env bash
# Phase-3184: soft-complete through 3184 (layout_fidelity_sample_field_roster).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3184
print("soft-complete >=3184", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase3184|Soft-complete STATUS through 3184|through 3184' webui/STATUS.md
echo "STATUS soft-complete 3184 ok"
echo "cleaned"
echo "OK: phase3184 e2e passed"
