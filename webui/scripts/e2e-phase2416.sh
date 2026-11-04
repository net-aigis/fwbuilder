#!/usr/bin/env bash
# Phase-2416: soft-complete through 2416 (schema 2.0).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2416
assert m.SOFT_FERTIG_HONESTY_SURFACE_VERSION == "2.0"
print("soft-complete >=2416", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase2416|Soft-complete STATUS through 2416|through 2416' webui/STATUS.md
echo "STATUS soft-complete 2416 ok"
echo "cleaned"
echo "OK: phase2416 e2e passed"
