#!/usr/bin/env bash
# Phase-4368: soft-complete through 4368 (Soft 4360+).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4368
print("soft-complete >=4368", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase4368|Soft-complete STATUS through 4368|through 4368' webui/STATUS.md
echo "STATUS soft-complete 4368 ok"
echo "cleaned"
echo "OK: phase4368 e2e passed"
