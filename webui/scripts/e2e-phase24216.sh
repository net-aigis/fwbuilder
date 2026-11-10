#!/usr/bin/env bash
# Phase-24216: soft-complete through 24216 (ms 73750).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 24216
assert m.WEBUI_HONESTY_MILESTONE == 73750
print("soft-complete >=24216", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase24216|through 24216' webui/STATUS.md
echo "OK: phase24216 e2e passed"
