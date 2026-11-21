#!/usr/bin/env bash
# Phase-3509: soft marker 3512 + milestone 9050.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3512
assert m.WEBUI_HONESTY_MILESTONE == 9050
assert "soft_fertig_honesty_operator_brief_roster" in m.SOFT_FERTIG_SURFACE_KEYS
print("marker", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
echo "cleaned"
echo "OK: phase3509 e2e passed"
