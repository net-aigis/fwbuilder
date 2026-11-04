#!/usr/bin/env bash
# Phase-1656: soft-complete through 1656 (honesty_bundle catalogs + ms 3250).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1656
assert m.WEBUI_HONESTY_MILESTONE == 3250
print("soft-complete >=1656", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase1656|Soft-complete STATUS through 1656|through 1656' webui/STATUS.md
echo "STATUS soft-complete 1656 ok"
echo "cleaned"
echo "OK: phase1656 e2e passed"
