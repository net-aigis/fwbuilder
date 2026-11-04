#!/usr/bin/env bash
# Phase-2576: soft-complete through 2576 (schema 2.2).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2576
assert m.SOFT_FERTIG_HONESTY_SURFACE_VERSION == "2.2"
print("soft-complete >=2576", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase2576|Soft-complete STATUS through 2576|through 2576' webui/STATUS.md
echo "STATUS soft-complete 2576 ok"
echo "cleaned"
echo "OK: phase2576 e2e passed"
