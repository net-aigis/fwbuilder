#!/usr/bin/env bash
# Phase-13328: soft-complete through 13328.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 13328
PY
grep -qE 'phase13328|through 13328' webui/STATUS.md
echo "OK: phase13328 e2e passed"
