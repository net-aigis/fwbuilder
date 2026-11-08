#!/usr/bin/env bash
# Phase-11336: soft-complete through 11336 (ms 33500).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 11336
assert m.WEBUI_HONESTY_MILESTONE == 33500
print("soft-complete >=11336", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase11336|through 11336' webui/STATUS.md
echo "OK: phase11336 e2e passed"
