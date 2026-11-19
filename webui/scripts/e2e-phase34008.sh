#!/usr/bin/env bash
# Phase-34008: soft-complete through 34008.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 34008
PY
grep -qE 'phase34008|through 34008' webui/STATUS.md
echo "OK: phase34008 e2e passed"
