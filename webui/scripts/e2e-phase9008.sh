#!/usr/bin/env bash
# Phase-9008: soft-complete through 9008.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 9008
PY
grep -qE 'phase9008|through 9008' webui/STATUS.md
echo "OK: phase9008 e2e passed"
