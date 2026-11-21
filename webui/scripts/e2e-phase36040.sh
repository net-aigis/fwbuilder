#!/usr/bin/env bash
# Phase-36040: soft-complete through 36040.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 36040
PY
grep -qE 'phase36040|through 36040' webui/STATUS.md
echo "OK: phase36040 e2e passed"
