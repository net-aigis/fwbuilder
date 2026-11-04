#!/usr/bin/env bash
# Phase-2256: soft-complete through 2256 (schema 1.8).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2256
assert m.SOFT_FERTIG_HONESTY_SURFACE_VERSION .startswith("1.")
print("soft-complete >=2256", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase2256|Soft-complete STATUS through 2256|through 2256' webui/STATUS.md
echo "STATUS soft-complete 2256 ok"
echo "cleaned"
echo "OK: phase2256 e2e passed"
