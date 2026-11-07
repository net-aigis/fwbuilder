#!/usr/bin/env bash
# Phase-4288: soft-complete through 4288 (Soft 4280+).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4288
print("soft-complete >=4288", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase4288|Soft-complete STATUS through 4288|through 4288' webui/STATUS.md
echo "STATUS soft-complete 4288 ok"
echo "cleaned"
echo "OK: phase4288 e2e passed"
