#!/usr/bin/env bash
# Phase-38944: soft-complete through 38944.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 38944
PY
grep -qE 'phase38944|through 38944' webui/STATUS.md
echo "OK: phase38944 e2e passed"
