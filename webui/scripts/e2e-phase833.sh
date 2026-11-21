#!/usr/bin/env bash
# Phase-833: flat/checkable/annotations hard-gaps sample.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
from fwbweb_api.platforms import layout_fidelity_for
f = layout_fidelity_for("iptables", "linux24")
assert (f.get("pages") or {}).get("sections_with_flat", 0) > 0
assert (f.get("pages") or {}).get("sections_with_checkable", 0) > 0
assert (f.get("pages") or {}).get("annotations", 0) > 0
h = m.hard_gaps()
s = m.hard_gaps_summary()
assert h.get("layout_fidelity_sample_sections_with_flat") == f["pages"]["sections_with_flat"]
assert h.get("layout_fidelity_sample_sections_with_checkable") == f["pages"]["sections_with_checkable"]
assert h.get("layout_fidelity_sample_annotations") == f["pages"]["annotations"]
assert s.get("layout_fidelity_sample_sections_with_flat") == f["pages"]["sections_with_flat"]
assert s.get("layout_fidelity_sample_annotations") == f["pages"]["annotations"]
note = m.HARD_GAP_NOTES.get("full_qt_pixel_layout") or ""
assert "sections_with_flat" in note and "annotations" in note
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 840
print("flat", f["pages"]["sections_with_flat"], "checkable", f["pages"]["sections_with_checkable"], "ann", f["pages"]["annotations"])
PY
echo "cleaned"
echo "OK: phase833 e2e passed"
