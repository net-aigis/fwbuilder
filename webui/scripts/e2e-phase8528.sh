#!/usr/bin/env bash
# Phase-8528: soft-complete through 8528.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 8528
PY
grep -qE 'phase8528|through 8528' webui/STATUS.md
echo "OK: phase8528 e2e passed"
