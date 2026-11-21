#!/usr/bin/env bash
# Phase-1761: honesty milestone 3600 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 3600
assert "checkpoint 3600" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "soft_fertig_catalog_summary" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 3600
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1768
print("milestone 3600 ok")
PY
echo "cleaned"
echo "OK: phase1761 e2e passed"
