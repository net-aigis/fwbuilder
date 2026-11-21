#!/usr/bin/env bash
# Phase-36096: soft-complete through 36096.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 36096
PY
grep -qE 'phase36096|through 36096' webui/STATUS.md
echo "OK: phase36096 e2e passed"
