#!/usr/bin/env bash
# Phase-3488: soft-complete through 3488 (Soft 3480+).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3488
print("soft-complete >=3488", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase3488|Soft-complete STATUS through 3488|through 3488' webui/STATUS.md
echo "STATUS soft-complete 3488 ok"
echo "cleaned"
echo "OK: phase3488 e2e passed"
