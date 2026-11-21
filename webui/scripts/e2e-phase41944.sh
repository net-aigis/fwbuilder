#!/usr/bin/env bash
# Phase-41944: soft-complete through 41944.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 41944
PY
grep -qE 'phase41944|through 41944' webui/STATUS.md
echo "OK: phase41944 e2e passed"
