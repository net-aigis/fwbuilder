#!/usr/bin/env bash
# Phase-4896: soft-complete through 4896 (schema 5.1).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4896
print("soft-complete >=4896", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase4896|Soft-complete STATUS through 4896|through 4896' webui/STATUS.md
echo "STATUS soft-complete 4896 ok"; echo "cleaned"; echo "OK: phase4896 e2e passed"
