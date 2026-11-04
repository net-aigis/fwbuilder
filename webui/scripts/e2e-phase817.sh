#!/usr/bin/env bash
# Phase-817: stacked_sections hard-gaps sample.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
from fwbweb_api.platforms import layout_fidelity_for
f = layout_fidelity_for("iptables", "linux24")
assert (f.get("pages") or {}).get("stacked_sections", 0) > 0
assert isinstance((f.get("pages") or {}).get("empty_stacked_sections"), int)
h = m.hard_gaps()
s = m.hard_gaps_summary()
assert h.get("layout_fidelity_sample_stacked_sections") == f["pages"]["stacked_sections"]
assert h.get("layout_fidelity_sample_empty_stacked_sections") == f["pages"]["empty_stacked_sections"]
assert s.get("layout_fidelity_sample_stacked_sections") == f["pages"]["stacked_sections"]
assert s.get("layout_fidelity_sample_empty_stacked_sections") == f["pages"]["empty_stacked_sections"]
note = m.HARD_GAP_NOTES.get("full_qt_pixel_layout") or ""
assert "stacked_sections" in note
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 824
print("stacked", f["pages"]["stacked_sections"], "empty", f["pages"]["empty_stacked_sections"])
PY
echo "cleaned"
echo "OK: phase817 e2e passed"
