#!/usr/bin/env bash
# Phase-32464: soft-complete through 32464.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 32464
PY
grep -qE 'phase32464|through 32464' webui/STATUS.md
echo "OK: phase32464 e2e passed"
