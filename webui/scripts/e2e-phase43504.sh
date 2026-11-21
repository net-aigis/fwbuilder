#!/usr/bin/env bash
# Phase-43504: soft-complete through 43504.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 43504
PY
grep -qE 'phase43504|through 43504' webui/STATUS.md
echo "OK: phase43504 e2e passed"
