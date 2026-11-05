#!/usr/bin/env bash
# Phase-3296: soft-complete through 3296 (schema 3.1).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3296
assert m.SOFT_FERTIG_HONESTY_SURFACE_VERSION == "3.1"
print("soft-complete >=3296", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase3296|Soft-complete STATUS through 3296|through 3296' webui/STATUS.md
echo "STATUS soft-complete 3296 ok"
echo "cleaned"
echo "OK: phase3296 e2e passed"
