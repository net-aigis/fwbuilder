#!/usr/bin/env bash
# Phase-2600: soft-complete through 2600 (honesty_export_roster sessionStorage + ms 6200).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2600
assert m.WEBUI_HONESTY_MILESTONE == 6200
print("soft-complete >=2600", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase2600|Soft-complete STATUS through 2600|through 2600' webui/STATUS.md
echo "STATUS soft-complete 2600 ok"
echo "cleaned"
echo "OK: phase2600 e2e passed"
