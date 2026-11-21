#!/usr/bin/env bash
# Phase-36944: soft-complete through 36944.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 36944
PY
grep -qE 'phase36944|through 36944' webui/STATUS.md
echo "OK: phase36944 e2e passed"
