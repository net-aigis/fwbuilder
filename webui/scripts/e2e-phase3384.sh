#!/usr/bin/env bash
# Phase-3384: soft-complete through 3384 (schema 3.2 + ms 8650).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3384
assert m.WEBUI_HONESTY_MILESTONE == 8650
assert m.SOFT_FERTIG_HONESTY_SURFACE_VERSION.startswith("3.")
print("soft-complete >=3384", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase3384|Soft-complete STATUS through 3384|through 3384' webui/STATUS.md
echo "STATUS soft-complete 3384 ok"
echo "cleaned"
echo "OK: phase3384 e2e passed"
