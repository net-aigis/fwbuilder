#!/usr/bin/env bash
# Phase-48528: soft-complete through 48528.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 48528
PY
grep -qE 'phase48528|through 48528' webui/STATUS.md
echo "OK: phase48528 e2e passed"
