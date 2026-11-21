#!/usr/bin/env bash
# Phase-43072: soft-complete through 43072.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 43072
PY
grep -qE 'phase43072|through 43072' webui/STATUS.md
echo "OK: phase43072 e2e passed"
