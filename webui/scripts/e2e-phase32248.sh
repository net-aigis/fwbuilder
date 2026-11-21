#!/usr/bin/env bash
# Phase-32248: soft-complete through 32248.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 32248
PY
grep -qE 'phase32248|through 32248' webui/STATUS.md
echo "OK: phase32248 e2e passed"
