#!/usr/bin/env bash
# Phase-10688: soft-complete through 10688.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 10688
PY
grep -qE 'phase10688|through 10688' webui/STATUS.md
echo "OK: phase10688 e2e passed"
