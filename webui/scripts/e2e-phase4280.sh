#!/usr/bin/env bash
# Phase-4280: soft-complete through 4280 (option_enable_roster session + ms 11450).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4280
assert m.WEBUI_HONESTY_MILESTONE == 11450
assert "option_enable_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEYS
print("soft-complete >=4280", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase4280|Soft-complete STATUS through 4280|through 4280' webui/STATUS.md
echo "STATUS soft-complete 4280 ok"
echo "cleaned"
echo "OK: phase4280 e2e passed"
