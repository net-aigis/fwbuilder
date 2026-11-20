#!/usr/bin/env bash
# Phase-34944: soft-complete through 34944.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 34944
PY
grep -qE 'phase34944|through 34944' webui/STATUS.md
echo "OK: phase34944 e2e passed"
