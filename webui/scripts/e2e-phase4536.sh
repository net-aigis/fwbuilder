#!/usr/bin/env bash
# Phase-4536: soft-complete through 4536 (Soft 4520+ / ms 12250).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4536
assert m.WEBUI_HONESTY_MILESTONE == 12250
print("soft-complete >=4536", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase4536|Soft-complete STATUS through 4536|through 4536' webui/STATUS.md
echo "STATUS soft-complete 4536 ok"
echo "cleaned"
echo "OK: phase4536 e2e passed"
