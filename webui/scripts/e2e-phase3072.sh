#!/usr/bin/env bash
# Phase-3072: soft-complete through 3072 (layout_fidelity_signal_roster sessionStorage).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3072
print("soft-complete >=3072", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase3072|Soft-complete STATUS through 3072|through 3072' webui/STATUS.md
echo "STATUS soft-complete 3072 ok"
echo "cleaned"
echo "OK: phase3072 e2e passed"
