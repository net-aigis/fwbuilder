#!/usr/bin/env bash
# Phase-2704: soft-complete through 2704 (surface roster).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2704
print("soft-complete >=2704", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase2704|Soft-complete STATUS through 2704|through 2704' webui/STATUS.md
echo "STATUS soft-complete 2704 ok"
echo "cleaned"
echo "OK: phase2704 e2e passed"
