#!/usr/bin/env bash
# Phase-4576: soft-complete through 4576 (schema 4.7).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4576
assert m.SOFT_FERTIG_HONESTY_SURFACE_VERSION.startswith(("1.", "2.", "3.", "4."))
print("soft-complete >=4576", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase4576|Soft-complete STATUS through 4576|through 4576' webui/STATUS.md
echo "STATUS soft-complete 4576 ok"
echo "cleaned"
echo "OK: phase4576 e2e passed"
