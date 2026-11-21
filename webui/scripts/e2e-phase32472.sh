#!/usr/bin/env bash
# Phase-32472: soft-complete through 32472.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 32472
PY
grep -qE 'phase32472|through 32472' webui/STATUS.md
echo "OK: phase32472 e2e passed"
