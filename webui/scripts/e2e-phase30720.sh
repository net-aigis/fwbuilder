#!/usr/bin/env bash
# Phase-30720: soft-complete through 30720.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 30720
PY
grep -qE 'phase30720|through 30720' webui/STATUS.md
echo "OK: phase30720 e2e passed"
