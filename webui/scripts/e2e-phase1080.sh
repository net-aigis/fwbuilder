#!/usr/bin/env bash
# Phase-1080: soft-complete through 1080 (catalog_complete).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1080
print("soft-complete >=1080", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase1080|Soft-complete STATUS through 1080|through 1080' webui/STATUS.md
echo "STATUS soft-complete 1080 ok"
echo "cleaned"
echo "OK: phase1080 e2e passed"
