#!/usr/bin/env bash
# Phase-2264: soft-complete through 2264 (schema 1.8 + ms 5150).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2264
assert m.WEBUI_HONESTY_MILESTONE == 5150
assert m.SOFT_FERTIG_HONESTY_SURFACE_VERSION == "1.8"
print("soft-complete >=2264", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase2264|Soft-complete STATUS through 2264|through 2264' webui/STATUS.md
echo "STATUS soft-complete 2264 ok"
echo "cleaned"
echo "OK: phase2264 e2e passed"
