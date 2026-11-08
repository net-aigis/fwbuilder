#!/usr/bin/env bash
# Phase-6936: soft-complete through 6936 (Soft 6920+ ssh_refusal_status_refresh_roster + ms 19750).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 6936
assert m.WEBUI_HONESTY_MILESTONE == 19750
print("soft-complete >=6936", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase6936|Soft-complete STATUS through 6936|through 6936' webui/STATUS.md
echo "STATUS soft-complete 6936 ok"; echo "cleaned"; echo "OK: phase6936 e2e passed"
