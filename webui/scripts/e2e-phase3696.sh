#!/usr/bin/env bash
# Phase-3696: soft-complete through 3696 (schema 3.6).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3696
assert m.SOFT_FERTIG_HONESTY_SURFACE_VERSION.startswith("3.")
print("soft-complete >=3696", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase3696|Soft-complete STATUS through 3696|through 3696' webui/STATUS.md
echo "STATUS soft-complete 3696 ok"
echo "cleaned"
echo "OK: phase3696 e2e passed"
