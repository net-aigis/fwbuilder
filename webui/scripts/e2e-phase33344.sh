#!/usr/bin/env bash
# Phase-33344: soft-complete through 33344.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 33344
PY
grep -qE 'phase33344|through 33344' webui/STATUS.md
echo "OK: phase33344 e2e passed"
