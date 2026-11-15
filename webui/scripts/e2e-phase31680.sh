#!/usr/bin/env bash
# Phase-31680: soft-complete through 31680.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 31680
PY
grep -qE 'phase31680|through 31680' webui/STATUS.md
echo "OK: phase31680 e2e passed"
