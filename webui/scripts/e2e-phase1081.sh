#!/usr/bin/env bash
# Phase-1081: honesty milestone 1500 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 1500
assert "checkpoint 1500" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "catalog_complete" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 1500
assert h.get("layout_fidelity_sample_catalog_complete") is True
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1088
print("milestone 1500 ok")
PY
echo "cleaned"
echo "OK: phase1081 e2e passed"
