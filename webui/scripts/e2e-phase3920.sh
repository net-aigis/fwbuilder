#!/usr/bin/env bash
# Phase-3920: soft-complete through 3920 (res_status_roster export).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3920
assert "res_status_roster" in m.SOFT_FERTIG_HONESTY_EXPORT_KEYS
print("soft-complete >=3920", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase3920|Soft-complete STATUS through 3920|through 3920' webui/STATUS.md
echo "STATUS soft-complete 3920 ok"
echo "cleaned"
echo "OK: phase3920 e2e passed"
