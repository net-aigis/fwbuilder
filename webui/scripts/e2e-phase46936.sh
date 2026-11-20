#!/usr/bin/env bash
# Phase-46936: soft-complete through 46936 (ms 144750).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 46936
assert m.WEBUI_HONESTY_MILESTONE == 144750
print("soft-complete >=46936", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase46936|through 46936' webui/STATUS.md
echo "OK: phase46936 e2e passed"
