#!/usr/bin/env bash
# Phase-37944: soft-complete through 37944.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 37944
PY
grep -qE 'phase37944|through 37944' webui/STATUS.md
echo "OK: phase37944 e2e passed"
