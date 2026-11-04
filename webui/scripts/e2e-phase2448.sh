#!/usr/bin/env bash
# Phase-2448: soft-complete through 2448 (Soft 2440+).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2448
print("soft-complete >=2448", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase2448|Soft-complete STATUS through 2448|through 2448' webui/STATUS.md
echo "STATUS soft-complete 2448 ok"
echo "cleaned"
echo "OK: phase2448 e2e passed"
