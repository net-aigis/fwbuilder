#!/usr/bin/env bash
# Phase-1049: with_external_label hard-gaps sample.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
from fwbweb_api.platforms import layout_fidelity_for
f = layout_fidelity_for("iptables", "linux24")
assert "with_external_label" in f["fields"]
assert isinstance(f["fields"]["with_external_label"], int)
h = m.hard_gaps()
s = m.hard_gaps_summary()
assert h.get("layout_fidelity_sample_with_external_label") == f["fields"]["with_external_label"]
assert s.get("layout_fidelity_sample_with_external_label") == f["fields"]["with_external_label"]
assert isinstance(h.get("layout_fidelity_sample_with_external_label"), int)
note = m.HARD_GAP_NOTES.get("full_qt_pixel_layout") or ""
assert "with_external_label" in note
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1056
print("with_external_label", f["fields"]["with_external_label"], "keys", h.get("layout_fidelity_sample_key_count"))
PY
echo "cleaned"
echo "OK: phase1049 e2e passed"
