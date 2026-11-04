#!/usr/bin/env bash
# Phase-1097: honesty milestone 1550 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 1550
assert "checkpoint 1550" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "iosacl" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 1550
assert h.get("layout_fidelity_alt_sample_platform") == "iosacl"
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1104
print("milestone 1550 ok")
PY
echo "cleaned"
echo "OK: phase1097 e2e passed"
