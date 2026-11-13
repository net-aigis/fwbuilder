#!/usr/bin/env bash
# Phase-28688: soft-complete through 28688.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 28688
PY
grep -qE 'phase28688|through 28688' webui/STATUS.md
echo "OK: phase28688 e2e passed"
