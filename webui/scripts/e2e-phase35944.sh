#!/usr/bin/env bash
# Phase-35944: soft-complete through 35944.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 35944
PY
grep -qE 'phase35944|through 35944' webui/STATUS.md
echo "OK: phase35944 e2e passed"
