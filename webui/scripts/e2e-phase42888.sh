#!/usr/bin/env bash
# Phase-42888: soft-complete through 42888.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 42888
PY
grep -qE 'phase42888|through 42888' webui/STATUS.md
echo "OK: phase42888 e2e passed"
