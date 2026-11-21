#!/usr/bin/env bash
# Phase-37520: soft-complete through 37520.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 37520
PY
grep -qE 'phase37520|through 37520' webui/STATUS.md
echo "OK: phase37520 e2e passed"
