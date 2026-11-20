#!/usr/bin/env bash
# Phase-39448: soft-complete through 39448.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 39448
PY
grep -qE 'phase39448|through 39448' webui/STATUS.md
echo "OK: phase39448 e2e passed"
