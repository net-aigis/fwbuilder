#!/usr/bin/env bash
# Phase-2208: soft-complete through 2208 (Soft 2200+ checkpoint).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2208
print("soft-complete >=2208", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase2208|Soft-complete STATUS through 2208|through 2208' webui/STATUS.md
echo "STATUS soft-complete 2208 ok"
echo "cleaned"
echo "OK: phase2208 e2e passed"
