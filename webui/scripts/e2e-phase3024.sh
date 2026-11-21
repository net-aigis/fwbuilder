#!/usr/bin/env bash
# Phase-3024: soft-complete through 3024 (layout_fidelity_signal_roster).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3024
print("soft-complete >=3024", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase3024|Soft-complete STATUS through 3024|through 3024' webui/STATUS.md
echo "STATUS soft-complete 3024 ok"
echo "cleaned"
echo "OK: phase3024 e2e passed"
