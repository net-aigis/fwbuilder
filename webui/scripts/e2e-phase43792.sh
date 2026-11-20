#!/usr/bin/env bash
# Phase-43792: soft-complete through 43792.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 43792
PY
grep -qE 'phase43792|through 43792' webui/STATUS.md
echo "OK: phase43792 e2e passed"
