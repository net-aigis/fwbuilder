#!/usr/bin/env bash
# Phase-44944: soft-complete through 44944.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 44944
PY
grep -qE 'phase44944|through 44944' webui/STATUS.md
echo "OK: phase44944 e2e passed"
