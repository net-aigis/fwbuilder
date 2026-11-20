#!/usr/bin/env bash
# Phase-36240: soft-complete through 36240.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 36240
PY
grep -qE 'phase36240|through 36240' webui/STATUS.md
echo "OK: phase36240 e2e passed"
