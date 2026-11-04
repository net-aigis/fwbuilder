#!/usr/bin/env bash
# Phase-1073: catalog_complete hard-gaps sample flag.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
h = m.hard_gaps()
s = m.hard_gaps_summary()
assert h.get("layout_fidelity_sample_catalog_complete") is True
assert s.get("layout_fidelity_sample_catalog_complete") is True
assert h.get("layout_fidelity_sample_key_count", 0) >= 47
note = m.HARD_GAP_NOTES.get("full_qt_pixel_layout") or ""
assert "catalog_complete" in note
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1080
print("catalog_complete", h["layout_fidelity_sample_catalog_complete"], "keys", h["layout_fidelity_sample_key_count"])
PY
echo "cleaned"
echo "OK: phase1073 e2e passed"
