#!/usr/bin/env bash
# Phase-1089: alt iosacl hard-gaps sample.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
from fwbweb_api.platforms import layout_fidelity_for
alt = layout_fidelity_for("iosacl", "ios")
assert alt.get("ok")
assert (alt.get("pages") or {}).get("buddy_labels", 0) > 0
assert (alt.get("fields") or {}).get("with_external_label", 0) > 0
h = m.hard_gaps()
s = m.hard_gaps_summary()
assert h.get("layout_fidelity_alt_sample_platform") == "iosacl"
assert h.get("layout_fidelity_alt_sample_host_os") == "ios"
assert h.get("layout_fidelity_alt_sample_buddy_labels") == alt["pages"]["buddy_labels"]
assert h.get("layout_fidelity_alt_sample_with_external_label") == alt["fields"]["with_external_label"]
assert s.get("layout_fidelity_alt_sample_buddy_labels") == alt["pages"]["buddy_labels"]
note = m.HARD_GAP_NOTES.get("full_qt_pixel_layout") or ""
assert "alt iosacl" in note
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1096
print("alt buddies", h["layout_fidelity_alt_sample_buddy_labels"], "ext", h["layout_fidelity_alt_sample_with_external_label"])
PY
echo "cleaned"
echo "OK: phase1089 e2e passed"
