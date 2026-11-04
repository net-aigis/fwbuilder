#!/usr/bin/env bash
# Phase-937: with_size_policy total hard-gaps sample.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
from fwbweb_api.platforms import layout_fidelity_for
f = layout_fidelity_for("iptables", "linux24")
assert f["fields"].get("with_size_policy", 0) > 0
h = m.hard_gaps()
s = m.hard_gaps_summary()
assert h.get("layout_fidelity_sample_with_size_policy") == f["fields"]["with_size_policy"]
assert s.get("layout_fidelity_sample_with_size_policy") == f["fields"]["with_size_policy"]
note = m.HARD_GAP_NOTES.get("full_qt_pixel_layout") or ""
assert "with_size_policy total" in note
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 944
print("with_size_policy", f["fields"]["with_size_policy"])
PY
echo "cleaned"
echo "OK: phase937 e2e passed"
