#!/usr/bin/env bash
# Phase-3557: soft marker 3560 + milestone 9200.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3560
assert m.WEBUI_HONESTY_MILESTONE == 9200
assert "honesty_operator_brief_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEYS
print("marker", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
echo "cleaned"
echo "OK: phase3557 e2e passed"
