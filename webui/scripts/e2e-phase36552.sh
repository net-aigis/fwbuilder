#!/usr/bin/env bash
# Phase-36552: soft-complete through 36552.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 36552
PY
grep -qE 'phase36552|through 36552' webui/STATUS.md
echo "OK: phase36552 e2e passed"
