#!/usr/bin/env bash
# Phase-905: chrome window_title/tab_position hard-gaps sample.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
from fwbweb_api.platforms import layout_fidelity_for
f = layout_fidelity_for("iptables", "linux24")
assert (f.get("chrome") or {}).get("window_title") is True
assert isinstance((f.get("chrome") or {}).get("tab_position"), bool)
h = m.hard_gaps()
s = m.hard_gaps_summary()
assert h.get("layout_fidelity_sample_chrome_window_title") is True
assert h.get("layout_fidelity_sample_chrome_tab_position") == f["chrome"]["tab_position"]
assert s.get("layout_fidelity_sample_chrome_window_title") is True
assert s.get("layout_fidelity_sample_chrome_tab_position") == f["chrome"]["tab_position"]
note = m.HARD_GAP_NOTES.get("full_qt_pixel_layout") or ""
assert "window_title" in note and "tab_position" in note
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 912
print("window_title", f["chrome"]["window_title"], "tab_position", f["chrome"]["tab_position"])
PY
echo "cleaned"
echo "OK: phase905 e2e passed"
