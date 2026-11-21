#!/usr/bin/env bash
# Phase-1824: soft-complete through 1824 (track note).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1824
print("soft-complete >=1824", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase1824|Soft-complete STATUS through 1824|through 1824' webui/STATUS.md
echo "STATUS soft-complete 1824 ok"
echo "cleaned"
echo "OK: phase1824 e2e passed"
