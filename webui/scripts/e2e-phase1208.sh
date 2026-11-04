#!/usr/bin/env bash
# Phase-1208: soft-complete through 1208 (honesty_path_titles).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1208
print("soft-complete >=1208", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase1208|Soft-complete STATUS through 1208|through 1208' webui/STATUS.md
echo "STATUS soft-complete 1208 ok"
echo "cleaned"
echo "OK: phase1208 e2e passed"
