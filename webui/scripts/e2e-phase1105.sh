#!/usr/bin/env bash
# Phase-1105: alt2 junosacl hard-gaps sample.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
from fwbweb_api.platforms import layout_fidelity_for
alt2 = layout_fidelity_for("junosacl", "junos")
assert alt2.get("ok")
assert (alt2.get("fields") or {}).get("with_enabled", 0) > 0
h = m.hard_gaps()
s = m.hard_gaps_summary()
assert h.get("layout_fidelity_alt2_sample_platform") == "junosacl"
assert h.get("layout_fidelity_alt2_sample_host_os") == "junos"
assert h.get("layout_fidelity_alt2_sample_with_enabled") == alt2["fields"]["with_enabled"]
assert s.get("layout_fidelity_alt2_sample_with_enabled") == alt2["fields"]["with_enabled"]
note = m.HARD_GAP_NOTES.get("full_qt_pixel_layout") or ""
assert "alt2 junosacl" in note
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1112
print("alt2 enabled", h["layout_fidelity_alt2_sample_with_enabled"])
PY
echo "cleaned"
echo "OK: phase1105 e2e passed"
