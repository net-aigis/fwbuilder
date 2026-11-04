#!/usr/bin/env bash
# Phase-961: with_visible hard-gaps sample.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
from fwbweb_api.platforms import layout_fidelity_for
f = layout_fidelity_for("iptables", "linux24")
assert "with_visible" in f["fields"]
assert isinstance(f["fields"]["with_visible"], int)
h = m.hard_gaps()
s = m.hard_gaps_summary()
assert h.get("layout_fidelity_sample_with_visible") == f["fields"]["with_visible"]
assert s.get("layout_fidelity_sample_with_visible") == f["fields"]["with_visible"]
assert isinstance(h.get("layout_fidelity_sample_with_visible"), int)
assert h.get("layout_fidelity_sample_key_count", 0) >= 37
note = m.HARD_GAP_NOTES.get("full_qt_pixel_layout") or ""
assert "with_visible" in note
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 968
print("with_visible", f["fields"]["with_visible"], "keys", h["layout_fidelity_sample_key_count"])
PY
echo "cleaned"
echo "OK: phase961 e2e passed"
