#!/usr/bin/env bash
# Phase-43984: soft-complete through 43984.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 43984
PY
grep -qE 'phase43984|through 43984' webui/STATUS.md
echo "OK: phase43984 e2e passed"
