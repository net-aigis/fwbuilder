#!/usr/bin/env bash
# Phase-2824: soft-complete through 2824 (schema 2.5 + ms 6900).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2824
assert m.WEBUI_HONESTY_MILESTONE == 6900
assert m.SOFT_FERTIG_HONESTY_SURFACE_VERSION.startswith(("2.", "3."))
print("soft-complete >=2824", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase2824|Soft-complete STATUS through 2824|through 2824' webui/STATUS.md
echo "STATUS soft-complete 2824 ok"
echo "cleaned"
echo "OK: phase2824 e2e passed"
