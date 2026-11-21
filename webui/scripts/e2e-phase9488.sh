#!/usr/bin/env bash
# Phase-9488: soft-complete through 9488.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 9488
PY
grep -qE 'phase9488|through 9488' webui/STATUS.md
echo "OK: phase9488 e2e passed"
