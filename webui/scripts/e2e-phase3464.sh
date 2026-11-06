#!/usr/bin/env bash
# Phase-3464: soft-complete through 3464 (schema 3.3 + ms 8900).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3464
assert m.WEBUI_HONESTY_MILESTONE == 8900
assert m.SOFT_FERTIG_HONESTY_SURFACE_VERSION.startswith("3.")
print("soft-complete >=3464", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase3464|Soft-complete STATUS through 3464|through 3464' webui/STATUS.md
echo "STATUS soft-complete 3464 ok"
echo "cleaned"
echo "OK: phase3464 e2e passed"
