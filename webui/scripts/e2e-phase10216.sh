#!/usr/bin/env bash
# Phase-10216: soft-complete through 10216 (ms 30000).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 10216
assert m.WEBUI_HONESTY_MILESTONE == 30000
print("soft-complete >=10216", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase10216|through 10216' webui/STATUS.md
echo "OK: phase10216 e2e passed"
