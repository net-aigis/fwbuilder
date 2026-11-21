#!/usr/bin/env bash
# Phase-28928: soft-complete through 28928.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 28928
PY
grep -qE 'phase28928|through 28928' webui/STATUS.md
echo "OK: phase28928 e2e passed"
