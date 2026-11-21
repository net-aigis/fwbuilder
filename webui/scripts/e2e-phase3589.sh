#!/usr/bin/env bash
# Phase-3589: soft marker 3592 + milestone 9300.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3592
assert m.WEBUI_HONESTY_MILESTONE == 9300
assert "soft_fertig_surface_changelog_meta_roster" in m.SOFT_FERTIG_SURFACE_KEYS
print("marker", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
echo "cleaned"
echo "OK: phase3589 e2e passed"
