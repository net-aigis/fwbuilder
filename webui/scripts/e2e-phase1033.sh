#!/usr/bin/env bash
# Phase-1033: pages_with_tooltip hard-gaps sample.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
from fwbweb_api.platforms import layout_fidelity_for
f = layout_fidelity_for("iptables", "linux24")
assert "pages_with_tooltip" in f["pages"]
assert isinstance(f["pages"]["pages_with_tooltip"], int)
h = m.hard_gaps()
s = m.hard_gaps_summary()
assert h.get("layout_fidelity_sample_pages_with_tooltip") == f["pages"]["pages_with_tooltip"]
assert s.get("layout_fidelity_sample_pages_with_tooltip") == f["pages"]["pages_with_tooltip"]
assert isinstance(h.get("layout_fidelity_sample_pages_with_tooltip"), int)
note = m.HARD_GAP_NOTES.get("full_qt_pixel_layout") or ""
assert "pages_with_tooltip" in note
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1040
print("pages_with_tooltip", f["pages"]["pages_with_tooltip"], "keys", h.get("layout_fidelity_sample_key_count"))
PY
echo "cleaned"
echo "OK: phase1033 e2e passed"
