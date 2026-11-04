#!/usr/bin/env bash
# Phase-689: spacer sizeType extract + fidelity orientation/size_type counts.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'size_type' webui/scripts/extract-dialog-fields.py
grep -Fq 'spacers_with_orientation' webui/backend/fwbweb_api/platforms.py
grep -Fq 'spacers_with_size_type' webui/backend/fwbweb_api/platforms.py
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
from fwbweb_api.platforms import layout_fidelity_for
f = layout_fidelity_for("iptables", "linux24")
assert f.get("ok")
pages = f["pages"]
assert pages.get("spacers_with_orientation", 0) > 0
assert pages.get("spacers_with_size_type", 0) > 0
assert f.get("score_parts_count") >= 21
assert "spacers_with_orientation" in (m.HARD_GAP_NOTES.get("full_qt_pixel_layout") or "")
assert m.WEBUI_SOFT_COMPLETE_PHASE == "696"
print(
    "spacer fidelity",
    pages["spacers_with_orientation"],
    pages["spacers_with_size_type"],
    "score",
    f["score_percent"],
)
PY
echo "cleaned"
echo "OK: phase689 e2e passed"
