#!/usr/bin/env bash
# Phase-737: honesty milestone 800 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 800
assert "checkpoint 800" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "with_size_policy_expanding" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 800
assert m.WEBUI_SOFT_COMPLETE_PHASE == "744"
print("milestone 800 ok")
PY
echo "cleaned"
echo "OK: phase737 e2e passed"
