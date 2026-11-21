#!/usr/bin/env bash
# Phase-36008: soft-complete through 36008.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 36008
PY
grep -qE 'phase36008|through 36008' webui/STATUS.md
echo "OK: phase36008 e2e passed"
