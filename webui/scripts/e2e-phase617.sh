#!/usr/bin/env bash
# Phase-617: health honesty_milestone + soft_fertig + hard_gap_count.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
h = m.health()
assert h.get("honesty_milestone") == m.WEBUI_HONESTY_MILESTONE
assert h.get("soft_fertig_honesty_track") is True
assert h.get("hard_gap_count") == 3
assert int(h["soft_complete_phase"]) >= 624
print("health honesty ok", h["soft_complete_phase"])
PY
echo "cleaned"
echo "OK: phase617 e2e passed"
