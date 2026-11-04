#!/usr/bin/env bash
# Phase-777: with_size_policy_minimum fidelity + hard-gaps sample.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
from fwbweb_api.platforms import layout_fidelity_for
f = layout_fidelity_for("iptables", "linux24")
assert f["fields"].get("with_size_policy_minimum", 0) > 0
assert f.get("score_parts_count") >= 24
assert "with_size_policy_minimum" in ((f.get("signal_keys") or {}).get("fields") or [])
h = m.hard_gaps()
s = m.hard_gaps_summary()
assert h.get("layout_fidelity_sample_with_size_policy_minimum") == f["fields"]["with_size_policy_minimum"]
assert s.get("layout_fidelity_sample_with_size_policy_minimum") == f["fields"]["with_size_policy_minimum"]
note = m.HARD_GAP_NOTES.get("full_qt_pixel_layout") or ""
assert "expanding/fixed/minimum" in note or "with_size_policy_minimum" in note
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 784
print("minimum", f["fields"]["with_size_policy_minimum"], "score", f["score_percent"], "parts", f["score_parts_count"])
PY
echo "cleaned"
echo "OK: phase777 e2e passed"
