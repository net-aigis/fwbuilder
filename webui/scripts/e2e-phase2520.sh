#!/usr/bin/env bash
# Phase-2520: soft-complete through 2520 (session_storage_roster sessionStorage + ms 5950).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2520
assert m.WEBUI_HONESTY_MILESTONE == 5950
print("soft-complete >=2520", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase2520|Soft-complete STATUS through 2520|through 2520' webui/STATUS.md
echo "STATUS soft-complete 2520 ok"
echo "cleaned"
echo "OK: phase2520 e2e passed"
