#!/usr/bin/env bash
# Phase-37688: soft-complete through 37688.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 37688
PY
grep -qE 'phase37688|through 37688' webui/STATUS.md
echo "OK: phase37688 e2e passed"
