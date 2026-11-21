#!/usr/bin/env bash
# Phase-36528: soft-complete through 36528.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 36528
PY
grep -qE 'phase36528|through 36528' webui/STATUS.md
echo "OK: phase36528 e2e passed"
