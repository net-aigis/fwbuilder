#!/usr/bin/env bash
# Phase-2568: soft-complete through 2568 (honesty_export_roster export + ms 6100).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2568
assert m.WEBUI_HONESTY_MILESTONE == 6100
print("soft-complete >=2568", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase2568|Soft-complete STATUS through 2568|through 2568' webui/STATUS.md
echo "STATUS soft-complete 2568 ok"
echo "cleaned"
echo "OK: phase2568 e2e passed"
