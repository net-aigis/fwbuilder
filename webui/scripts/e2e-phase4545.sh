#!/usr/bin/env bash
# Phase-4545: honesty milestone 12300 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 12300
assert "checkpoint 12300" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "ssh_auth" in m.WEBUI_HONESTY_MILESTONE_NOTE or "ssh-auth" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 12300
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4552
print("milestone 12300 ok")
PY
echo "cleaned"
echo "OK: phase4545 e2e passed"
