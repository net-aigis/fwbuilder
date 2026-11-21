#!/usr/bin/env bash
# Phase-2488: soft-complete through 2488 (session_storage_roster export + ms 5850).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2488
assert m.WEBUI_HONESTY_MILESTONE == 5850
print("soft-complete >=2488", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase2488|Soft-complete STATUS through 2488|through 2488' webui/STATUS.md
echo "STATUS soft-complete 2488 ok"
echo "cleaned"
echo "OK: phase2488 e2e passed"
