#!/usr/bin/env bash
# Phase-4625: honesty milestone 12550 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 12550
assert "checkpoint 12550" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "password_ssh" in m.WEBUI_HONESTY_MILESTONE_NOTE or "password-ssh" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 12550
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4632
print("milestone 12550 ok")
PY
echo "cleaned"
echo "OK: phase4625 e2e passed"
