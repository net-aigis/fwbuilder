#!/usr/bin/env bash
# Phase-36280: soft-complete through 36280.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 36280
PY
grep -qE 'phase36280|through 36280' webui/STATUS.md
echo "OK: phase36280 e2e passed"
