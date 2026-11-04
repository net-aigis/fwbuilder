#!/usr/bin/env bash
# Phase-1617: honesty milestone 3150 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 3150
assert "checkpoint 3150" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "soft_fertig_honesty_bundle_sections" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 3150
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1624
print("milestone 3150 ok")
PY
echo "cleaned"
echo "OK: phase1617 e2e passed"
