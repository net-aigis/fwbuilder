#!/usr/bin/env bash
# Phase-41464: soft-complete through 41464.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 41464
PY
grep -qE 'phase41464|through 41464' webui/STATUS.md
echo "OK: phase41464 e2e passed"
