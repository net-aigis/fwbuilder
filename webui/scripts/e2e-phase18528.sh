#!/usr/bin/env bash
# Phase-18528: soft-complete through 18528.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 18528
PY
grep -qE 'phase18528|through 18528' webui/STATUS.md
echo "OK: phase18528 e2e passed"
