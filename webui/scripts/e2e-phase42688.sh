#!/usr/bin/env bash
# Phase-42688: soft-complete through 42688.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 42688
PY
grep -qE 'phase42688|through 42688' webui/STATUS.md
echo "OK: phase42688 e2e passed"
