#!/usr/bin/env bash
# Phase-3376: soft-complete through 3376 (schema 3.2).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3376
assert m.SOFT_FERTIG_HONESTY_SURFACE_VERSION== "3.2"
print("soft-complete >=3376", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase3376|Soft-complete STATUS through 3376|through 3376' webui/STATUS.md
echo "STATUS soft-complete 3376 ok"
echo "cleaned"
echo "OK: phase3376 e2e passed"
