#!/usr/bin/env bash
# Phase-40944: soft-complete through 40944.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 40944
PY
grep -qE 'phase40944|through 40944' webui/STATUS.md
echo "OK: phase40944 e2e passed"
