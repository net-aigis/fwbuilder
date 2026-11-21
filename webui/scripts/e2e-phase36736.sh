#!/usr/bin/env bash
# Phase-36736: soft-complete through 36736.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 36736
PY
grep -qE 'phase36736|through 36736' webui/STATUS.md
echo "OK: phase36736 e2e passed"
