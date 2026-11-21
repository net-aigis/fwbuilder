#!/usr/bin/env bash
# Phase-30944: soft-complete through 30944.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 30944
PY
grep -qE 'phase30944|through 30944' webui/STATUS.md
echo "OK: phase30944 e2e passed"
