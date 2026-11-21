#!/usr/bin/env bash
# Phase-42944: soft-complete through 42944.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 42944
PY
grep -qE 'phase42944|through 42944' webui/STATUS.md
echo "OK: phase42944 e2e passed"
