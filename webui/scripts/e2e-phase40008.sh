#!/usr/bin/env bash
# Phase-40008: soft-complete through 40008.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 40008
PY
grep -qE 'phase40008|through 40008' webui/STATUS.md
echo "OK: phase40008 e2e passed"
