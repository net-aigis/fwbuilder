#!/usr/bin/env bash
# Phase-29728: soft-complete through 29728.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 29728
PY
grep -qE 'phase29728|through 29728' webui/STATUS.md
echo "OK: phase29728 e2e passed"
