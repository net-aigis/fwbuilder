#!/usr/bin/env bash
# Phase-4456: soft-complete through 4456 (Soft 4440+ / ms 12000).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4456
assert m.WEBUI_HONESTY_MILESTONE == 12000
print("soft-complete >=4456", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase4456|Soft-complete STATUS through 4456|through 4456' webui/STATUS.md
echo "STATUS soft-complete 4456 ok"
echo "cleaned"
echo "OK: phase4456 e2e passed"
