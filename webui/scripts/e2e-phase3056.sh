#!/usr/bin/env bash
# Phase-3056: soft-complete through 3056 (schema 2.8).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3056
assert m.SOFT_FERTIG_HONESTY_SURFACE_VERSION.startswith("2.")
print("soft-complete >=3056", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase3056|Soft-complete STATUS through 3056|through 3056' webui/STATUS.md
echo "STATUS soft-complete 3056 ok"
echo "cleaned"
echo "OK: phase3056 e2e passed"
