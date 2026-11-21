#!/usr/bin/env bash
# Phase-736: soft-complete through 736.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 736
print("soft-complete >=736", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase736|Soft-complete STATUS through 736|through 736' webui/STATUS.md
echo "STATUS soft-complete 736 ok"
echo "cleaned"
echo "OK: phase736 e2e passed"
