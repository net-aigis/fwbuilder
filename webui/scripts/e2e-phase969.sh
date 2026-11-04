#!/usr/bin/env bash
# Phase-969: spacers_with_size_hint hard-gaps sample.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
from fwbweb_api.platforms import layout_fidelity_for
f = layout_fidelity_for("iptables", "linux24")
assert f["pages"].get("spacers_with_size_hint", 0) > 0
h = m.hard_gaps()
s = m.hard_gaps_summary()
assert h.get("layout_fidelity_sample_spacers_with_size_hint") == f["pages"]["spacers_with_size_hint"]
assert s.get("layout_fidelity_sample_spacers_with_size_hint") == f["pages"]["spacers_with_size_hint"]
assert h.get("layout_fidelity_sample_key_count", 0) >= 38
note = m.HARD_GAP_NOTES.get("full_qt_pixel_layout") or ""
assert "spacers_with_size_hint" in note
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 976
print("spacers_with_size_hint", f["pages"]["spacers_with_size_hint"], "keys", h["layout_fidelity_sample_key_count"])
PY
echo "cleaned"
echo "OK: phase969 e2e passed"
