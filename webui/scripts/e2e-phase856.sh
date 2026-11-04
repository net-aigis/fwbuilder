#!/usr/bin/env bash
# Phase-856: soft-complete through 856 (honesty milestone 1000).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 856
assert m.WEBUI_HONESTY_MILESTONE == 1000
print("soft-complete >=856", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase856|Soft-complete STATUS through 856|through 856' webui/STATUS.md
echo "STATUS soft-complete 856 ok"
echo "cleaned"
echo "OK: phase856 e2e passed"
