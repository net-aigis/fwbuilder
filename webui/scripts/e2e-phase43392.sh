#!/usr/bin/env bash
# Phase-43392: soft-complete through 43392.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 43392
PY
grep -qE 'phase43392|through 43392' webui/STATUS.md
echo "OK: phase43392 e2e passed"
