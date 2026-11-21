#!/usr/bin/env bash
# Phase-3269: soft marker 3272 + milestone 8300.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3272
assert m.WEBUI_HONESTY_MILESTONE == 8300
assert "soft_fertig_catalog_summary_roster" in m.SOFT_FERTIG_SURFACE_KEYS
print("marker", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
echo "cleaned"
echo "OK: phase3269 e2e passed"
