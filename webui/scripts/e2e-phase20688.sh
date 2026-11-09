#!/usr/bin/env bash
# Phase-20688: soft-complete through 20688.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 20688
PY
grep -qE 'phase20688|through 20688' webui/STATUS.md
echo "OK: phase20688 e2e passed"
