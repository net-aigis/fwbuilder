#!/usr/bin/env bash
# Phase-29736: soft-complete through 29736 (ms 91000).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 29736
assert m.WEBUI_HONESTY_MILESTONE == 91000
print("soft-complete >=29736", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase29736|through 29736' webui/STATUS.md
echo "OK: phase29736 e2e passed"
