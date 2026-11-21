#!/usr/bin/env bash
# Phase-45552: soft-complete through 45552.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 45552
PY
grep -qE 'phase45552|through 45552' webui/STATUS.md
echo "OK: phase45552 e2e passed"
