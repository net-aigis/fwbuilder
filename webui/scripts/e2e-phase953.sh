#!/usr/bin/env bash
# Phase-953: layout_fidelity_sample_key_count on hard-gaps/summary.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
h = m.hard_gaps()
s = m.hard_gaps_summary()
assert isinstance(h.get("layout_fidelity_sample_key_count"), int)
assert h["layout_fidelity_sample_key_count"] >= 36
assert s.get("layout_fidelity_sample_key_count") == h["layout_fidelity_sample_key_count"]
# key_count itself is not included in the tally
assert "layout_fidelity_sample_key_count" in h
note = m.HARD_GAP_NOTES.get("full_qt_pixel_layout") or ""
assert "layout_fidelity_sample_key_count" in note
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 960
print("sample_key_count", h["layout_fidelity_sample_key_count"])
PY
echo "cleaned"
echo "OK: phase953 e2e passed"
