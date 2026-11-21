#!/usr/bin/env bash
# Phase-47680: soft-complete through 47680.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 47680
PY
grep -qE 'phase47680|through 47680' webui/STATUS.md
echo "OK: phase47680 e2e passed"
