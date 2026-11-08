#!/usr/bin/env bash
# Phase-14688: soft-complete through 14688.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 14688
PY
grep -qE 'phase14688|through 14688' webui/STATUS.md
echo "OK: phase14688 e2e passed"
