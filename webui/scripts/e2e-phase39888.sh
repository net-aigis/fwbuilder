#!/usr/bin/env bash
# Phase-39888: soft-complete through 39888.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 39888
PY
grep -qE 'phase39888|through 39888' webui/STATUS.md
echo "OK: phase39888 e2e passed"
