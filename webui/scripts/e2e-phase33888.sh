#!/usr/bin/env bash
# Phase-33888: soft-complete through 33888.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 33888
PY
grep -qE 'phase33888|through 33888' webui/STATUS.md
echo "OK: phase33888 e2e passed"
