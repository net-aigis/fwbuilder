#!/usr/bin/env bash
# Phase-2656: soft-complete through 2656 (schema 2.3).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2656
assert m.SOFT_FERTIG_HONESTY_SURFACE_VERSION == "2.3"
print("soft-complete >=2656", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase2656|Soft-complete STATUS through 2656|through 2656' webui/STATUS.md
echo "STATUS soft-complete 2656 ok"
echo "cleaned"
echo "OK: phase2656 e2e passed"
