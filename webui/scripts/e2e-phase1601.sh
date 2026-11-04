#!/usr/bin/env bash
# Phase-1601: honesty milestone 3100 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 3100
assert "checkpoint 3100" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "soft_fertig_honesty_export_keys" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 3100
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1608
print("milestone 3100 ok")
PY
echo "cleaned"
echo "OK: phase1601 e2e passed"
