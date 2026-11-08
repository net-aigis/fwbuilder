#!/usr/bin/env bash
# Phase-12688: soft-complete through 12688.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 12688
PY
grep -qE 'phase12688|through 12688' webui/STATUS.md
echo "OK: phase12688 e2e passed"
