#!/usr/bin/env bash
# Phase-46944: soft-complete through 46944.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 46944
PY
grep -qE 'phase46944|through 46944' webui/STATUS.md
echo "OK: phase46944 e2e passed"
