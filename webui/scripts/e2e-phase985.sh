#!/usr/bin/env bash
# Phase-985: with_whats_this hard-gaps sample.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
from fwbweb_api.platforms import layout_fidelity_for
f = layout_fidelity_for("iptables", "linux24")
assert "with_whats_this" in f["fields"]
assert isinstance(f["fields"]["with_whats_this"], int)
h = m.hard_gaps()
s = m.hard_gaps_summary()
assert h.get("layout_fidelity_sample_with_whats_this") == f["fields"]["with_whats_this"]
assert s.get("layout_fidelity_sample_with_whats_this") == f["fields"]["with_whats_this"]
assert isinstance(h.get("layout_fidelity_sample_with_whats_this"), int)
assert h.get("layout_fidelity_sample_key_count", 0) >= 40
note = m.HARD_GAP_NOTES.get("full_qt_pixel_layout") or ""
assert "with_whats_this" in note
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 992
print("with_whats_this", f["fields"]["with_whats_this"], "keys", h["layout_fidelity_sample_key_count"])
PY
echo "cleaned"
echo "OK: phase985 e2e passed"
