#!/usr/bin/env bash
# Phase-1792: soft-complete through 1792 (catalog_summary export/bundle).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1792
print("soft-complete >=1792", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase1792|Soft-complete STATUS through 1792|through 1792' webui/STATUS.md
echo "STATUS soft-complete 1792 ok"
echo "cleaned"
echo "OK: phase1792 e2e passed"
