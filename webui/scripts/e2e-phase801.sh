#!/usr/bin/env bash
# Phase-801: layout_tree_max_depth + buddy_labels hard-gaps sample.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
from fwbweb_api.platforms import layout_fidelity_for
f = layout_fidelity_for("iptables", "linux24")
assert (f.get("pages") or {}).get("layout_tree_max_depth", 0) > 0
# iptables/linux24 sample may have 0 buddy_labels; key must still be exposed.
assert isinstance((f.get("pages") or {}).get("buddy_labels"), int)
h = m.hard_gaps()
s = m.hard_gaps_summary()
assert h.get("layout_fidelity_sample_layout_tree_max_depth") == f["pages"]["layout_tree_max_depth"]
assert h.get("layout_fidelity_sample_buddy_labels") == f["pages"]["buddy_labels"]
assert s.get("layout_fidelity_sample_layout_tree_max_depth") == f["pages"]["layout_tree_max_depth"]
assert s.get("layout_fidelity_sample_buddy_labels") == f["pages"]["buddy_labels"]
note = m.HARD_GAP_NOTES.get("full_qt_pixel_layout") or ""
assert "layout_tree_max_depth" in note and "buddy_labels" in note
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 808
# Platforms with buddy_labels (iosacl/pix) prove the signal exists beyond the sample.
from fwbweb_api.platforms import layout_fidelity_for as _lf
assert (_lf("iosacl").get("pages") or {}).get("buddy_labels", 0) > 0
print("treeDepth", f["pages"]["layout_tree_max_depth"], "buddies", f["pages"]["buddy_labels"])
PY
echo "cleaned"
echo "OK: phase801 e2e passed"
