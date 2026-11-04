#!/usr/bin/env bash
# Phase-785: with_minimum_size/maximum_size hard-gaps sample.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
from fwbweb_api.platforms import layout_fidelity_for
f = layout_fidelity_for("iptables", "linux24")
assert f["fields"].get("with_minimum_size", 0) > 0
assert f["fields"].get("with_maximum_size", 0) > 0
h = m.hard_gaps()
s = m.hard_gaps_summary()
assert h.get("layout_fidelity_sample_with_minimum_size") == f["fields"]["with_minimum_size"]
assert h.get("layout_fidelity_sample_with_maximum_size") == f["fields"]["with_maximum_size"]
assert s.get("layout_fidelity_sample_with_minimum_size") == f["fields"]["with_minimum_size"]
assert s.get("layout_fidelity_sample_with_maximum_size") == f["fields"]["with_maximum_size"]
note = m.HARD_GAP_NOTES.get("full_qt_pixel_layout") or ""
assert "with_minimum_size" in note or "minimum_size/maximum_size" in note
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 792
print("min/max size", f["fields"]["with_minimum_size"], f["fields"]["with_maximum_size"])
PY
echo "cleaned"
echo "OK: phase785 e2e passed"
