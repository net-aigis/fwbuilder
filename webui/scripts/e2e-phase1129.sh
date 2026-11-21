#!/usr/bin/env bash
# Phase-1129: honesty milestone 1650 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 1650
assert "checkpoint 1650" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "pages_with_buddy_labels" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 1650
assert isinstance(h.get("layout_fidelity_alt_sample_pages_with_buddy_labels"), int)
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1136
print("milestone 1650 ok")
PY
echo "cleaned"
echo "OK: phase1129 e2e passed"
