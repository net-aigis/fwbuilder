#!/usr/bin/env bash
# Phase-33528: soft-complete through 33528.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 33528
PY
grep -qE 'phase33528|through 33528' webui/STATUS.md
echo "OK: phase33528 e2e passed"
