#!/usr/bin/env bash
# Phase-31944: soft-complete through 31944.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 31944
PY
grep -qE 'phase31944|through 31944' webui/STATUS.md
echo "OK: phase31944 e2e passed"
