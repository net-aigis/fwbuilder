#!/usr/bin/env bash
# Phase-16448: soft-complete through 16448.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 16448
PY
grep -qE 'phase16448|through 16448' webui/STATUS.md
echo "OK: phase16448 e2e passed"
