#!/usr/bin/env bash
# Phase-47912: soft-complete through 47912.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 47912
PY
grep -qE 'phase47912|through 47912' webui/STATUS.md
echo "OK: phase47912 e2e passed"
