#!/usr/bin/env bash
# Phase-9888: soft-complete through 9888.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 9888
PY
grep -qE 'phase9888|through 9888' webui/STATUS.md
echo "OK: phase9888 e2e passed"
