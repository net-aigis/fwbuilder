#!/usr/bin/env bash
# Phase-857: stretch/spacing/layout_tree/chrome hard-gaps sample.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
from fwbweb_api.platforms import layout_fidelity_for
f = layout_fidelity_for("iptables", "linux24")
assert (f.get("pages") or {}).get("pages_with_column_stretch", 0) > 0
assert (f.get("pages") or {}).get("pages_with_spacing", 0) > 0
assert (f.get("pages") or {}).get("pages_with_layout_tree", 0) > 0
assert (f.get("chrome") or {}).get("geometry") is True
assert (f.get("chrome") or {}).get("size_grip_enabled") is True
h = m.hard_gaps()
s = m.hard_gaps_summary()
assert h.get("layout_fidelity_sample_pages_with_column_stretch") == f["pages"]["pages_with_column_stretch"]
assert h.get("layout_fidelity_sample_pages_with_spacing") == f["pages"]["pages_with_spacing"]
assert h.get("layout_fidelity_sample_pages_with_layout_tree") == f["pages"]["pages_with_layout_tree"]
assert h.get("layout_fidelity_sample_chrome_geometry") is True
assert h.get("layout_fidelity_sample_chrome_size_grip_enabled") is True
assert s.get("layout_fidelity_sample_chrome_geometry") is True
note = m.HARD_GAP_NOTES.get("full_qt_pixel_layout") or ""
assert "column_stretch" in note and "size_grip" in note
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 864
print("stretch/spacing/tree/chrome ok")
PY
echo "cleaned"
echo "OK: phase857 e2e passed"
