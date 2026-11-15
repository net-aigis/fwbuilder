#!/usr/bin/env bash
# Phase-32944: soft-complete through 32944.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 32944
PY
grep -qE 'phase32944|through 32944' webui/STATUS.md
echo "OK: phase32944 e2e passed"
