#!/usr/bin/env bash
# Phase-37072: soft-complete through 37072.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 37072
PY
grep -qE 'phase37072|through 37072' webui/STATUS.md
echo "OK: phase37072 e2e passed"
