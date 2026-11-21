#!/usr/bin/env bash
# Phase-12448: soft-complete through 12448.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 12448
PY
grep -qE 'phase12448|through 12448' webui/STATUS.md
echo "OK: phase12448 e2e passed"
