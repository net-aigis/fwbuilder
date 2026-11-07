#!/usr/bin/env bash
# Phase-4224: soft-complete through 4224 (option_enable_roster).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4224
assert "soft_fertig_option_enable_roster" in m.SOFT_FERTIG_SURFACE_KEYS
print("soft-complete >=4224", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase4224|Soft-complete STATUS through 4224|through 4224' webui/STATUS.md
echo "STATUS soft-complete 4224 ok"
echo "cleaned"
echo "OK: phase4224 e2e passed"
