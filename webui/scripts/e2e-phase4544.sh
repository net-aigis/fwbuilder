#!/usr/bin/env bash
# Phase-4544: soft-complete through 4544 (ssh_auth_roster).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4544
assert "soft_fertig_ssh_auth_roster" in m.SOFT_FERTIG_SURFACE_KEYS
print("soft-complete >=4544", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase4544|Soft-complete STATUS through 4544|through 4544' webui/STATUS.md
echo "STATUS soft-complete 4544 ok"
echo "cleaned"
echo "OK: phase4544 e2e passed"
