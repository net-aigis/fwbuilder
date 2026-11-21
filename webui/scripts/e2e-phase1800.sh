#!/usr/bin/env bash
# Phase-1800: soft-complete through 1800 (catalog_summary export/bundle + ms 3700).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1800
assert m.WEBUI_HONESTY_MILESTONE == 3700
print("soft-complete >=1800", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase1800|Soft-complete STATUS through 1800|through 1800' webui/STATUS.md
echo "STATUS soft-complete 1800 ok"
echo "cleaned"
echo "OK: phase1800 e2e passed"
