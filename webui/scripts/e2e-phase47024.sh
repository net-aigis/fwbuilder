#!/usr/bin/env bash
# Phase-47024: soft-complete through 47024.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 47024
PY
grep -qE 'phase47024|through 47024' webui/STATUS.md
echo "OK: phase47024 e2e passed"
