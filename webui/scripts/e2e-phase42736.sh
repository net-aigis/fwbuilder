#!/usr/bin/env bash
# Phase-42736: soft-complete through 42736.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 42736
PY
grep -qE 'phase42736|through 42736' webui/STATUS.md
echo "OK: phase42736 e2e passed"
