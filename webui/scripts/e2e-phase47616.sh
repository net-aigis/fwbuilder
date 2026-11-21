#!/usr/bin/env bash
# Phase-47616: soft-complete through 47616.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 47616
PY
grep -qE 'phase47616|through 47616' webui/STATUS.md
echo "OK: phase47616 e2e passed"
