#!/usr/bin/env bash
# Phase-761: with_size_policy_fixed fidelity + hard-gaps sample.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
from fwbweb_api.platforms import layout_fidelity_for
f = layout_fidelity_for("iptables", "linux24")
assert f["fields"].get("with_size_policy_fixed", 0) > 0
assert f.get("score_parts_count") >= 23
assert "with_size_policy_fixed" in ((f.get("signal_keys") or {}).get("fields") or [])
h = m.hard_gaps()
s = m.hard_gaps_summary()
assert h.get("layout_fidelity_sample_with_size_policy_fixed") == f["fields"]["with_size_policy_fixed"]
assert s.get("layout_fidelity_sample_with_size_policy_fixed") == f["fields"]["with_size_policy_fixed"]
note = m.HARD_GAP_NOTES.get("full_qt_pixel_layout") or ""
assert "expanding/fixed" in note or "with_size_policy_fixed" in note
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 768
print("fixed", f["fields"]["with_size_policy_fixed"], "score", f["score_percent"], "parts", f["score_parts_count"])
PY
echo "cleaned"
echo "OK: phase761 e2e passed"
