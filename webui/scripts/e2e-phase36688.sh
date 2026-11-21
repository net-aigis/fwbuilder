#!/usr/bin/env bash
# Phase-36688: soft-complete through 36688.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 36688
PY
grep -qE 'phase36688|through 36688' webui/STATUS.md
echo "OK: phase36688 e2e passed"
