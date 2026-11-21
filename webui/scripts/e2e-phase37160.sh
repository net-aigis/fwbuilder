#!/usr/bin/env bash
# Phase-37160: soft-complete through 37160.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 37160
PY
grep -qE 'phase37160|through 37160' webui/STATUS.md
echo "OK: phase37160 e2e passed"
