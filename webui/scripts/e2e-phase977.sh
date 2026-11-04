#!/usr/bin/env bash
# Phase-977: signal_key_count hard-gaps sample.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
from fwbweb_api.platforms import layout_fidelity_for
f = layout_fidelity_for("iptables", "linux24")
sk = f.get("signal_keys") or {}
expected = len(sk.get("fields") or []) + len(sk.get("pages") or []) + len(sk.get("chrome") or [])
assert expected > 0
h = m.hard_gaps()
s = m.hard_gaps_summary()
assert h.get("layout_fidelity_sample_signal_key_count") == expected
assert s.get("layout_fidelity_sample_signal_key_count") == expected
assert h.get("layout_fidelity_sample_key_count", 0) >= 39
note = m.HARD_GAP_NOTES.get("full_qt_pixel_layout") or ""
assert "signal_key_count" in note
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 984
print("signal_key_count", expected, "keys", h["layout_fidelity_sample_key_count"])
PY
echo "cleaned"
echo "OK: phase977 e2e passed"
