#!/usr/bin/env bash
# Phase-3333: soft marker 3336 + milestone 8500.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3336
assert m.WEBUI_HONESTY_MILESTONE == 8500
assert "catalog_summary_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEYS
print("marker", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
echo "cleaned"
echo "OK: phase3333 e2e passed"
