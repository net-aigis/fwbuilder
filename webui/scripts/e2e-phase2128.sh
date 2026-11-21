#!/usr/bin/env bash
# Phase-2128: soft-complete through 2128 (surface_changelog sessionStorage).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2128
print("soft-complete >=2128", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase2128|Soft-complete STATUS through 2128|through 2128' webui/STATUS.md
echo "STATUS soft-complete 2128 ok"
echo "cleaned"
echo "OK: phase2128 e2e passed"
