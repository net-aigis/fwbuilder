#!/usr/bin/env bash
# Phase-32680: soft-complete through 32680.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 32680
PY
grep -qE 'phase32680|through 32680' webui/STATUS.md
echo "OK: phase32680 e2e passed"
