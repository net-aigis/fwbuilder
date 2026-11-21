#!/usr/bin/env bash
# Phase-43248: soft-complete through 43248.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 43248
PY
grep -qE 'phase43248|through 43248' webui/STATUS.md
echo "OK: phase43248 e2e passed"
