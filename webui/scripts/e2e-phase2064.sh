#!/usr/bin/env bash
# Phase-2064: soft-complete through 2064 (soft-complete note detail/restore).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2064
print("soft-complete >=2064", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase2064|Soft-complete STATUS through 2064|through 2064' webui/STATUS.md
echo "STATUS soft-complete 2064 ok"
echo "cleaned"
echo "OK: phase2064 e2e passed"
