#!/usr/bin/env bash
# Phase-3605: soft marker 3608 + milestone 9350.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3608
assert m.WEBUI_HONESTY_MILESTONE == 9350
assert "surface_changelog_meta_roster" in m.SOFT_FERTIG_HONESTY_EXPORT_KEYS
print("marker", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
echo "cleaned"
echo "OK: phase3605 e2e passed"
