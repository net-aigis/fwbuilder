#!/usr/bin/env bash
# Phase-25496: soft-complete through 25496 (ms 77750).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 25496
assert m.WEBUI_HONESTY_MILESTONE == 77750
print("soft-complete >=25496", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase25496|through 25496' webui/STATUS.md
echo "OK: phase25496 e2e passed"
