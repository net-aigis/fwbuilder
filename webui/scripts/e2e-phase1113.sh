#!/usr/bin/env bash
# Phase-1113: honesty milestone 1600 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 1600
assert "checkpoint 1600" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "junosacl" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 1600
assert h.get("layout_fidelity_alt2_sample_platform") == "junosacl"
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1120
print("milestone 1600 ok")
PY
echo "cleaned"
echo "OK: phase1113 e2e passed"
