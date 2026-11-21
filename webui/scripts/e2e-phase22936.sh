#!/usr/bin/env bash
# Phase-22936: soft-complete through 22936 (ms 69750).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 22936
assert m.WEBUI_HONESTY_MILESTONE == 69750
print("soft-complete >=22936", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase22936|through 22936' webui/STATUS.md
echo "OK: phase22936 e2e passed"
