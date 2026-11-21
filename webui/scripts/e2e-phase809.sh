#!/usr/bin/env bash
# Phase-809: with_size_policy_preferred fidelity + hard-gaps sample.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
from fwbweb_api.platforms import layout_fidelity_for
f = layout_fidelity_for("iptables", "linux24")
assert f["fields"].get("with_size_policy_preferred", 0) > 0
assert f.get("score_parts_count") >= 25
assert "with_size_policy_preferred" in ((f.get("signal_keys") or {}).get("fields") or [])
h = m.hard_gaps()
s = m.hard_gaps_summary()
assert h.get("layout_fidelity_sample_with_size_policy_preferred") == f["fields"]["with_size_policy_preferred"]
assert s.get("layout_fidelity_sample_with_size_policy_preferred") == f["fields"]["with_size_policy_preferred"]
note = m.HARD_GAP_NOTES.get("full_qt_pixel_layout") or ""
assert "preferred" in note
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 816
print("preferred", f["fields"]["with_size_policy_preferred"], "score", f["score_percent"], "parts", f["score_parts_count"])
PY
echo "cleaned"
echo "OK: phase809 e2e passed"
