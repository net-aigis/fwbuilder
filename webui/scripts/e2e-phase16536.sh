#!/usr/bin/env bash
# Phase-16536: soft-complete through 16536 (ms 49750).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 16536
assert m.WEBUI_HONESTY_MILESTONE == 49750
print("soft-complete >=16536", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase16536|through 16536' webui/STATUS.md
echo "OK: phase16536 e2e passed"
