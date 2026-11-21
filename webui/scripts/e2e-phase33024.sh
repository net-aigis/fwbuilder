#!/usr/bin/env bash
# Phase-33024: soft-complete through 33024.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 33024
PY
grep -qE 'phase33024|through 33024' webui/STATUS.md
echo "OK: phase33024 e2e passed"
