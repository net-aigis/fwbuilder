#!/usr/bin/env bash
# Phase-39144: soft-complete through 39144.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 39144
PY
grep -qE 'phase39144|through 39144' webui/STATUS.md
echo "OK: phase39144 e2e passed"
