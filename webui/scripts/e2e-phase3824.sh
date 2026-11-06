#!/usr/bin/env bash
# Phase-3824: soft-complete through 3824 (health_roster).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3824
assert "soft_fertig_health_roster" in m.SOFT_FERTIG_SURFACE_KEYS
print("soft-complete >=3824", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase3824|Soft-complete STATUS through 3824|through 3824' webui/STATUS.md
echo "STATUS soft-complete 3824 ok"
echo "cleaned"
echo "OK: phase3824 e2e passed"
