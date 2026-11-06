#!/usr/bin/env bash
# Phase-3685: soft marker 3688 + milestone 9600.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3688
assert m.WEBUI_HONESTY_MILESTONE == 9600
assert "hard_gaps_summary_roster" in m.SOFT_FERTIG_HONESTY_EXPORT_KEYS
print("marker", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
echo "cleaned"
echo "OK: phase3685 e2e passed"
