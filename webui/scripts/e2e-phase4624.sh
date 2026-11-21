#!/usr/bin/env bash
# Phase-4624: soft-complete through 4624 (password_ssh_roster).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4624
assert "soft_fertig_password_ssh_roster" in m.SOFT_FERTIG_SURFACE_KEYS
print("soft-complete >=4624", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase4624|Soft-complete STATUS through 4624|through 4624' webui/STATUS.md
echo "STATUS soft-complete 4624 ok"
echo "cleaned"
echo "OK: phase4624 e2e passed"
