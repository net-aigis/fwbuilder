#!/usr/bin/env bash
# Phase-1001: with_enabled hard-gaps sample.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
from fwbweb_api.platforms import layout_fidelity_for
f = layout_fidelity_for("iptables", "linux24")
assert "with_enabled" in f["fields"]
assert isinstance(f["fields"]["with_enabled"], int)
h = m.hard_gaps()
s = m.hard_gaps_summary()
assert h.get("layout_fidelity_sample_with_enabled") == f["fields"]["with_enabled"]
assert s.get("layout_fidelity_sample_with_enabled") == f["fields"]["with_enabled"]
assert isinstance(h.get("layout_fidelity_sample_with_enabled"), int)
note = m.HARD_GAP_NOTES.get("full_qt_pixel_layout") or ""
assert "with_enabled" in note
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1008
print("with_enabled", f["fields"]["with_enabled"], "keys", h.get("layout_fidelity_sample_key_count"))
PY
echo "cleaned"
echo "OK: phase1001 e2e passed"
