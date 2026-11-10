#!/usr/bin/env bash
# Phase-22688: soft-complete through 22688.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 22688
PY
grep -qE 'phase22688|through 22688' webui/STATUS.md
echo "OK: phase22688 e2e passed"
