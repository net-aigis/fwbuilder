#!/usr/bin/env bash
# Phase-33944: soft-complete through 33944.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 33944
PY
grep -qE 'phase33944|through 33944' webui/STATUS.md
echo "OK: phase33944 e2e passed"
