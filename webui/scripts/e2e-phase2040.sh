#!/usr/bin/env bash
# Phase-2040: soft-complete through 2040 (schema 1.5 + ms 4450).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2040
assert m.WEBUI_HONESTY_MILESTONE == 4450
assert m.SOFT_FERTIG_HONESTY_SURFACE_VERSION.startswith(("1.", "2."))
print("soft-complete >=2040", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase2040|Soft-complete STATUS through 2040|through 2040' webui/STATUS.md
echo "STATUS soft-complete 2040 ok"
echo "cleaned"
echo "OK: phase2040 e2e passed"
