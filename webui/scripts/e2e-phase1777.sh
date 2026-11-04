#!/usr/bin/env bash
# Phase-1777: honesty milestone 3650 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 3650
assert "checkpoint 3650" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "soft_fertig_catalog_summary" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 3650
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1784
print("milestone 3650 ok")
PY
echo "cleaned"
echo "OK: phase1777 e2e passed"
