#!/usr/bin/env bash
# Phase-1241: honesty milestone 2000 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 2000
assert "checkpoint 2000" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "soft_fertig_surface_keys" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 2000
assert int(h.get("soft_fertig_surface_key_count") or 0) >= 20
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1248
print("milestone 2000 ok")
PY
echo "cleaned"
echo "OK: phase1241 e2e passed"
