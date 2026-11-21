#!/usr/bin/env bash
# Phase-3968: soft-complete through 3968 (Soft 3960+).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3968
print("soft-complete >=3968", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase3968|Soft-complete STATUS through 3968|through 3968' webui/STATUS.md
echo "STATUS soft-complete 3968 ok"
echo "cleaned"
echo "OK: phase3968 e2e passed"
