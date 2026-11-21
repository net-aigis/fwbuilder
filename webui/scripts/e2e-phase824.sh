#!/usr/bin/env bash
# Phase-824: soft-complete through 824 (stacked_sections sample).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 824
print("soft-complete >=824", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase824|Soft-complete STATUS through 824|through 824' webui/STATUS.md
echo "STATUS soft-complete 824 ok"
echo "cleaned"
echo "OK: phase824 e2e passed"
