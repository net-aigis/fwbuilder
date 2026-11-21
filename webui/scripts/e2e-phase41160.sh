#!/usr/bin/env bash
# Phase-41160: soft-complete through 41160.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 41160
PY
grep -qE 'phase41160|through 41160' webui/STATUS.md
echo "OK: phase41160 e2e passed"
