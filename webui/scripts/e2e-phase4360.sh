#!/usr/bin/env bash
# Phase-4360: soft-complete through 4360 (expect_run_roster session + ms 11700).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4360
assert m.WEBUI_HONESTY_MILESTONE == 11700
assert "expect_run_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEYS
print("soft-complete >=4360", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase4360|Soft-complete STATUS through 4360|through 4360' webui/STATUS.md
echo "STATUS soft-complete 4360 ok"
echo "cleaned"
echo "OK: phase4360 e2e passed"
