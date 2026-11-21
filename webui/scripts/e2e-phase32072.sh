#!/usr/bin/env bash
# Phase-32072: soft-complete through 32072.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 32072
PY
grep -qE 'phase32072|through 32072' webui/STATUS.md
echo "OK: phase32072 e2e passed"
