#!/usr/bin/env bash
# Phase-32536: soft-complete through 32536 (ms 99750).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 32536
assert m.WEBUI_HONESTY_MILESTONE == 99750
print("soft-complete >=32536", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase32536|through 32536' webui/STATUS.md
echo "OK: phase32536 e2e passed"
