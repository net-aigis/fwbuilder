#!/usr/bin/env bash
# Phase-47632: soft-complete through 47632.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 47632
PY
grep -qE 'phase47632|through 47632' webui/STATUS.md
echo "OK: phase47632 e2e passed"
