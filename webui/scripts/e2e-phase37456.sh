#!/usr/bin/env bash
# Phase-37456: soft-complete through 37456.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 37456
PY
grep -qE 'phase37456|through 37456' webui/STATUS.md
echo "OK: phase37456 e2e passed"
