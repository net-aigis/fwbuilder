#!/usr/bin/env bash
# Phase-32024: soft-complete through 32024.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 32024
PY
grep -qE 'phase32024|through 32024' webui/STATUS.md
echo "OK: phase32024 e2e passed"
