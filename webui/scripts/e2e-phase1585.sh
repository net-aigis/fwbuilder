#!/usr/bin/env bash
# Phase-1585: honesty milestone 3050 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 3050
assert "checkpoint 3050" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "soft_fertig_honesty_export_keys" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 3050
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1592
print("milestone 3050 ok")
PY
echo "cleaned"
echo "OK: phase1585 e2e passed"
