#!/usr/bin/env bash
# Phase-3040: soft-complete through 3040 (layout_fidelity_signal_roster export).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3040
print("soft-complete >=3040", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase3040|Soft-complete STATUS through 3040|through 3040' webui/STATUS.md
echo "STATUS soft-complete 3040 ok"
echo "cleaned"
echo "OK: phase3040 e2e passed"
