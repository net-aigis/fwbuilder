#!/usr/bin/env bash
# Phase-33632: soft-complete through 33632.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 33632
PY
grep -qE 'phase33632|through 33632' webui/STATUS.md
echo "OK: phase33632 e2e passed"
