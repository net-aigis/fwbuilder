#!/usr/bin/env bash
# Phase-729: with_size_policy_expanding fidelity + hard-gaps sample.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
from fwbweb_api.platforms import layout_fidelity_for
f = layout_fidelity_for("iptables", "linux24")
assert f["fields"].get("with_size_policy_expanding", 0) > 0
assert f.get("score_parts_count") >= 22
assert "with_size_policy_expanding" in ((f.get("signal_keys") or {}).get("fields") or [])
h = m.hard_gaps()
s = m.hard_gaps_summary()
assert h.get("layout_fidelity_sample_with_size_policy_expanding") == f["fields"]["with_size_policy_expanding"]
assert s.get("layout_fidelity_sample_with_size_policy_expanding") == f["fields"]["with_size_policy_expanding"]
assert "with_size_policy_expanding" in (m.HARD_GAP_NOTES.get("full_qt_pixel_layout") or "")
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 736
print("expanding", f["fields"]["with_size_policy_expanding"], "score", f["score_percent"])
PY
echo "cleaned"
echo "OK: phase729 e2e passed"
