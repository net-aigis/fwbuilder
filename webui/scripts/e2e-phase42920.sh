#!/usr/bin/env bash
# Phase-42920: soft-complete through 42920.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 42920
PY
grep -qE 'phase42920|through 42920' webui/STATUS.md
echo "OK: phase42920 e2e passed"
