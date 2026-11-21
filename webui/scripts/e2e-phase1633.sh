#!/usr/bin/env bash
# Phase-1633: honesty milestone 3200 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 3200
assert "checkpoint 3200" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "soft_fertig_honesty_bundle_sections" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 3200
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1640
print("milestone 3200 ok")
PY
echo "cleaned"
echo "OK: phase1633 e2e passed"
