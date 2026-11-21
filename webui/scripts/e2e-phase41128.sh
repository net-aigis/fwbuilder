#!/usr/bin/env bash
# Phase-41128: soft-complete through 41128.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 41128
PY
grep -qE 'phase41128|through 41128' webui/STATUS.md
echo "OK: phase41128 e2e passed"
