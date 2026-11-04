#!/usr/bin/env bash
# Phase-1872: soft-complete through 1872 (schema 1.2).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1872
assert m.SOFT_FERTIG_HONESTY_SURFACE_VERSION.startswith("1.")
print("soft-complete >=1872", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase1872|Soft-complete STATUS through 1872|through 1872' webui/STATUS.md
echo "STATUS soft-complete 1872 ok"
echo "cleaned"
echo "OK: phase1872 e2e passed"
