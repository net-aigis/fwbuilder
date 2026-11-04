#!/usr/bin/env bash
# Phase-705: summary exposes spacer sample counts; hard-gap note mentions qtSpacerStyle.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
s = m.hard_gaps_summary()
assert isinstance(s.get("layout_fidelity_sample_spacers"), int)
assert s["layout_fidelity_sample_spacers"] > 0
assert s.get("layout_fidelity_sample_spacers_with_orientation") == s["layout_fidelity_sample_spacers"] or (
    isinstance(s.get("layout_fidelity_sample_spacers_with_orientation"), int)
    and s["layout_fidelity_sample_spacers_with_orientation"] > 0
)
assert isinstance(s.get("layout_fidelity_sample_spacers_with_size_type"), int)
assert "qtSpacerStyle" in (m.HARD_GAP_NOTES.get("full_qt_pixel_layout") or "")
assert m.WEBUI_SOFT_COMPLETE_PHASE == "712"
print("summary spacers", s["layout_fidelity_sample_spacers"], s["layout_fidelity_sample_spacers_with_size_type"])
PY
echo "cleaned"
echo "OK: phase705 e2e passed"
