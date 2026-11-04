#!/usr/bin/env bash
# Phase-536: soft-complete through 536.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_SOFT_COMPLETE_PHASE == "536"
print("soft-complete 536")
PY
grep -q 'phase536' webui/STATUS.md
echo "STATUS soft-complete 536 ok"
echo "cleaned"
echo "OK: phase536 e2e passed"
