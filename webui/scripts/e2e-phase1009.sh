#!/usr/bin/env bash
# Phase-1009: with_alignment hard-gaps sample.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
from fwbweb_api.platforms import layout_fidelity_for
f = layout_fidelity_for("iptables", "linux24")
assert "with_alignment" in f["fields"]
assert isinstance(f["fields"]["with_alignment"], int)
h = m.hard_gaps()
s = m.hard_gaps_summary()
assert h.get("layout_fidelity_sample_with_alignment") == f["fields"]["with_alignment"]
assert s.get("layout_fidelity_sample_with_alignment") == f["fields"]["with_alignment"]
assert isinstance(h.get("layout_fidelity_sample_with_alignment"), int)
note = m.HARD_GAP_NOTES.get("full_qt_pixel_layout") or ""
assert "with_alignment" in note
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1016
print("with_alignment", f["fields"]["with_alignment"], "keys", h.get("layout_fidelity_sample_key_count"))
PY
echo "cleaned"
echo "OK: phase1009 e2e passed"
