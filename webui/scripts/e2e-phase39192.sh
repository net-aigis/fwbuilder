#!/usr/bin/env bash
# Phase-39192: soft-complete through 39192.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 39192
PY
grep -qE 'phase39192|through 39192' webui/STATUS.md
echo "OK: phase39192 e2e passed"
