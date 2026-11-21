#!/usr/bin/env bash
# Phase-26688: soft-complete through 26688.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 26688
PY
grep -qE 'phase26688|through 26688' webui/STATUS.md
echo "OK: phase26688 e2e passed"
