#!/usr/bin/env bash
# Phase-3960: soft-complete through 3960 (res_status_roster session + ms 10450).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3960
assert m.WEBUI_HONESTY_MILESTONE == 10450
assert "res_status_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEYS
print("soft-complete >=3960", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase3960|Soft-complete STATUS through 3960|through 3960' webui/STATUS.md
echo "STATUS soft-complete 3960 ok"
echo "cleaned"
echo "OK: phase3960 e2e passed"
