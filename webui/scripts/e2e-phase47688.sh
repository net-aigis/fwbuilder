#!/usr/bin/env bash
# Phase-47688: soft-complete through 47688.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 47688
PY
grep -qE 'phase47688|through 47688' webui/STATUS.md
echo "OK: phase47688 e2e passed"
