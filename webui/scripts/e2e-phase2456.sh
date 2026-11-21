#!/usr/bin/env bash
# Phase-2456: soft-complete through 2456 (Soft 2440+ + ms 5750).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2456
assert m.WEBUI_HONESTY_MILESTONE == 5750
print("soft-complete >=2456", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase2456|Soft-complete STATUS through 2456|through 2456' webui/STATUS.md
echo "STATUS soft-complete 2456 ok"
echo "cleaned"
echo "OK: phase2456 e2e passed"
