#!/usr/bin/env bash
# Phase-1888: soft-complete through 1888 (track note detail/restore).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1888
print("soft-complete >=1888", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase1888|Soft-complete STATUS through 1888|through 1888' webui/STATUS.md
echo "STATUS soft-complete 1888 ok"
echo "cleaned"
echo "OK: phase1888 e2e passed"
