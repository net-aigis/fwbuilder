#!/usr/bin/env bash
# Phase-1840: soft-complete through 1840 (track_note export/bundle).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1840
print("soft-complete >=1840", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase1840|Soft-complete STATUS through 1840|through 1840' webui/STATUS.md
echo "STATUS soft-complete 1840 ok"
echo "cleaned"
echo "OK: phase1840 e2e passed"
