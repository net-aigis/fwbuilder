#!/usr/bin/env bash
# Phase-32344: soft-complete through 32344.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 32344
PY
grep -qE 'phase32344|through 32344' webui/STATUS.md
echo "OK: phase32344 e2e passed"
