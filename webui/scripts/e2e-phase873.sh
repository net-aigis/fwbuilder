#!/usr/bin/env bash
# Phase-873: with_grid/label/tooltip/fields hard-gaps sample.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
from fwbweb_api.platforms import layout_fidelity_for
f = layout_fidelity_for("iptables", "linux24")
assert f["fields"].get("with_grid", 0) > 0
assert f["fields"].get("with_label", 0) > 0
assert f["fields"].get("with_tooltip", 0) > 0
assert f["fields"].get("fields", 0) > 0
h = m.hard_gaps()
s = m.hard_gaps_summary()
assert h.get("layout_fidelity_sample_with_grid") == f["fields"]["with_grid"]
assert h.get("layout_fidelity_sample_with_label") == f["fields"]["with_label"]
assert h.get("layout_fidelity_sample_with_tooltip") == f["fields"]["with_tooltip"]
assert h.get("layout_fidelity_sample_fields") == f["fields"]["fields"]
assert s.get("layout_fidelity_sample_with_grid") == f["fields"]["with_grid"]
note = m.HARD_GAP_NOTES.get("full_qt_pixel_layout") or ""
assert "with_grid" in note and "tooltip" in note
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 880
print("grid/label/tooltip/fields", f["fields"]["with_grid"], f["fields"]["with_label"], f["fields"]["with_tooltip"], f["fields"]["fields"])
PY
echo "cleaned"
echo "OK: phase873 e2e passed"
