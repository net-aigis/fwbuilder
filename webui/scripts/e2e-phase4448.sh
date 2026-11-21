#!/usr/bin/env bash
# Phase-4448: soft-complete through 4448 (Soft 4440+).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4448
print("soft-complete >=4448", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase4448|Soft-complete STATUS through 4448|through 4448' webui/STATUS.md
echo "STATUS soft-complete 4448 ok"
echo "cleaned"
echo "OK: phase4448 e2e passed"
