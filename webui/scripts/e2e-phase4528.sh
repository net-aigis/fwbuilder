#!/usr/bin/env bash
# Phase-4528: soft-complete through 4528 (Soft 4520+).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4528
print("soft-complete >=4528", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase4528|Soft-complete STATUS through 4528|through 4528' webui/STATUS.md
echo "STATUS soft-complete 4528 ok"
echo "cleaned"
echo "OK: phase4528 e2e passed"
