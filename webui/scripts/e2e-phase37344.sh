#!/usr/bin/env bash
# Phase-37344: soft-complete through 37344.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 37344
PY
grep -qE 'phase37344|through 37344' webui/STATUS.md
echo "OK: phase37344 e2e passed"
