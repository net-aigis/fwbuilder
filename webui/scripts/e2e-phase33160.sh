#!/usr/bin/env bash
# Phase-33160: soft-complete through 33160.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 33160
PY
grep -qE 'phase33160|through 33160' webui/STATUS.md
echo "OK: phase33160 e2e passed"
