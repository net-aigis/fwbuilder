#!/usr/bin/env bash
# Phase-40929: tail milestone 126000 still on tip after Soft 40920+ block.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 126000
assert "ssh_auth_triacontatricosadeca_checkpoint_roster" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 40929
print("milestone 126000 tail ok", m.WEBUI_HONESTY_MILESTONE)
PY
echo "cleaned"; echo "OK: phase40929 e2e passed"
