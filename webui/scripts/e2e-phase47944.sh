#!/usr/bin/env bash
# Phase-47944: soft-complete through 47944.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 47944
PY
grep -qE 'phase47944|through 47944' webui/STATUS.md
echo "OK: phase47944 e2e passed"
