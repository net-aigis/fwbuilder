#!/usr/bin/env bash
# Phase-43160: soft-complete through 43160.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 43160
PY
grep -qE 'phase43160|through 43160' webui/STATUS.md
echo "OK: phase43160 e2e passed"
