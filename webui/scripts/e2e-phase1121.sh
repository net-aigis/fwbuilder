#!/usr/bin/env bash
# Phase-1121: alt pages_with_buddy_labels hard-gaps sample.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
from fwbweb_api.platforms import layout_fidelity_for
alt = layout_fidelity_for("iosacl", "ios")
assert (alt.get("pages") or {}).get("pages_with_buddy_labels", 0) > 0
h = m.hard_gaps()
s = m.hard_gaps_summary()
assert h.get("layout_fidelity_alt_sample_pages_with_buddy_labels") == alt["pages"]["pages_with_buddy_labels"]
assert s.get("layout_fidelity_alt_sample_pages_with_buddy_labels") == alt["pages"]["pages_with_buddy_labels"]
note = m.HARD_GAP_NOTES.get("full_qt_pixel_layout") or ""
assert "alt pages_with_buddy_labels" in note
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1128
print("alt pageBuddies", h["layout_fidelity_alt_sample_pages_with_buddy_labels"])
PY
echo "cleaned"
echo "OK: phase1121 e2e passed"
