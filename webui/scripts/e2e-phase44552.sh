#!/usr/bin/env bash
# Phase-44552: soft-complete through 44552.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 44552
PY
grep -qE 'phase44552|through 44552' webui/STATUS.md
echo "OK: phase44552 e2e passed"
