#!/usr/bin/env bash
# Phase-841: with_minimum_size/maximum_size in fidelity score weights.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
from fwbweb_api.platforms import layout_fidelity_for
f = layout_fidelity_for("iptables", "linux24")
assert f["fields"].get("with_minimum_size", 0) > 0
assert f["fields"].get("with_maximum_size", 0) > 0
assert f.get("score_parts_count") >= 27
assert "with_minimum_size" in ((f.get("signal_keys") or {}).get("fields") or [])
assert "with_maximum_size" in ((f.get("signal_keys") or {}).get("fields") or [])
note = m.HARD_GAP_NOTES.get("full_qt_pixel_layout") or ""
assert "score weights" in note or "with_minimum_size/maximum_size" in note
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 848
print("min/max score weights", f["fields"]["with_minimum_size"], f["fields"]["with_maximum_size"], "parts", f["score_parts_count"], "score", f["score_percent"])
PY
echo "cleaned"
echo "OK: phase841 e2e passed"
