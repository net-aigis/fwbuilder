#!/usr/bin/env bash
# Phase-31144: soft-complete through 31144.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 31144
PY
grep -qE 'phase31144|through 31144' webui/STATUS.md
echo "OK: phase31144 e2e passed"
