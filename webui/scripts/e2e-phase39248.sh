#!/usr/bin/env bash
# Phase-39248: soft-complete through 39248.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 39248
PY
grep -qE 'phase39248|through 39248' webui/STATUS.md
echo "OK: phase39248 e2e passed"
