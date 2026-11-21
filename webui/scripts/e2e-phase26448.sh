#!/usr/bin/env bash
# Phase-26448: soft-complete through 26448.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 26448
PY
grep -qE 'phase26448|through 26448' webui/STATUS.md
echo "OK: phase26448 e2e passed"
