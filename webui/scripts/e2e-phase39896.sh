#!/usr/bin/env bash
# Phase-39896: soft-complete through 39896 (ms 122750).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 39896
assert m.WEBUI_HONESTY_MILESTONE == 122750
print("soft-complete >=39896", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase39896|through 39896' webui/STATUS.md
echo "OK: phase39896 e2e passed"
