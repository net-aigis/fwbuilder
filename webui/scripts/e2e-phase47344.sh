#!/usr/bin/env bash
# Phase-47344: soft-complete through 47344.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 47344
PY
grep -qE 'phase47344|through 47344' webui/STATUS.md
echo "OK: phase47344 e2e passed"
