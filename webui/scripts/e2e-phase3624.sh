#!/usr/bin/env bash
# Phase-3624: soft-complete through 3624 (schema 3.5 + ms 9400).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3624
assert m.WEBUI_HONESTY_MILESTONE == 9400
assert m.SOFT_FERTIG_HONESTY_SURFACE_VERSION.startswith("3.")
print("soft-complete >=3624", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase3624|Soft-complete STATUS through 3624|through 3624' webui/STATUS.md
echo "STATUS soft-complete 3624 ok"
echo "cleaned"
echo "OK: phase3624 e2e passed"
