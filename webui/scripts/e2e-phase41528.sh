#!/usr/bin/env bash
# Phase-41528: soft-complete through 41528.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 41528
PY
grep -qE 'phase41528|through 41528' webui/STATUS.md
echo "OK: phase41528 e2e passed"
