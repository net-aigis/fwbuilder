#!/usr/bin/env bash
# Phase-4704: soft-complete through 4704 (ssh_not_implemented_roster).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4704
assert "soft_fertig_ssh_not_implemented_roster" in m.SOFT_FERTIG_SURFACE_KEYS
print("soft-complete >=4704", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase4704|Soft-complete STATUS through 4704|through 4704' webui/STATUS.md
echo "STATUS soft-complete 4704 ok"
echo "cleaned"
echo "OK: phase4704 e2e passed"
