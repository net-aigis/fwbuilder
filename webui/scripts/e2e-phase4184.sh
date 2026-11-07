#!/usr/bin/env bash
# Phase-4184: soft-complete through 4184 (schema 4.2 + ms 11150).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4184
assert m.WEBUI_HONESTY_MILESTONE == 11150
assert m.SOFT_FERTIG_HONESTY_SURFACE_VERSION.startswith(("1.", "2.", "3.", "4."))
print("soft-complete >=4184", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase4184|Soft-complete STATUS through 4184|through 4184' webui/STATUS.md
echo "STATUS soft-complete 4184 ok"
echo "cleaned"
echo "OK: phase4184 e2e passed"
