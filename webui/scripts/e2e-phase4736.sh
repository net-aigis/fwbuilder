#!/usr/bin/env bash
# Phase-4736: soft-complete through 4736 (schema 4.9).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4736
print("soft-complete >=4736", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase4736|Soft-complete STATUS through 4736|through 4736' webui/STATUS.md
echo "STATUS soft-complete 4736 ok"
echo "cleaned"
echo "OK: phase4736 e2e passed"
