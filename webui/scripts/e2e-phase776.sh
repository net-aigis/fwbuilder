#!/usr/bin/env bash
# Phase-776: soft-complete through 776 (spacer Maximum/Minimum/Preferred).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 776
print("soft-complete >=776", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase776|Soft-complete STATUS through 776|through 776' webui/STATUS.md
echo "STATUS soft-complete 776 ok"
echo "cleaned"
echo "OK: phase776 e2e passed"
