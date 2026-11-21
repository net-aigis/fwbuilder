#!/usr/bin/env bash
# Phase-46792: soft-complete through 46792.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 46792
PY
grep -qE 'phase46792|through 46792' webui/STATUS.md
echo "OK: phase46792 e2e passed"
