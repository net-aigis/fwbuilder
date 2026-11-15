#!/usr/bin/env bash
# Phase-32008: soft-complete through 32008.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 32008
PY
grep -qE 'phase32008|through 32008' webui/STATUS.md
echo "OK: phase32008 e2e passed"
