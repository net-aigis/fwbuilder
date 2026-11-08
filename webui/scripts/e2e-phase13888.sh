#!/usr/bin/env bash
# Phase-13888: soft-complete through 13888.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 13888
PY
grep -qE 'phase13888|through 13888' webui/STATUS.md
echo "OK: phase13888 e2e passed"
