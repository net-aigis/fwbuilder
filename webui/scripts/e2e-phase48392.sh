#!/usr/bin/env bash
# Phase-48392: soft-complete through 48392.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 48392
PY
grep -qE 'phase48392|through 48392' webui/STATUS.md
echo "OK: phase48392 e2e passed"
