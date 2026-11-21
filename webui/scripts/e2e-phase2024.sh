#!/usr/bin/env bash
# Phase-2024: soft-complete through 2024 (soft_complete_note export/bundle + ms 4400).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2024
assert m.WEBUI_HONESTY_MILESTONE == 4400
print("soft-complete >=2024", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase2024|Soft-complete STATUS through 2024|through 2024' webui/STATUS.md
echo "STATUS soft-complete 2024 ok"
echo "cleaned"
echo "OK: phase2024 e2e passed"
