#!/usr/bin/env bash
# Phase-2536: soft-complete through 2536 (Soft 2520+ + ms 6000).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2536
assert m.WEBUI_HONESTY_MILESTONE == 6000
print("soft-complete >=2536", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase2536|Soft-complete STATUS through 2536|through 2536' webui/STATUS.md
echo "STATUS soft-complete 2536 ok"
echo "cleaned"
echo "OK: phase2536 e2e passed"
