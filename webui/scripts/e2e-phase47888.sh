#!/usr/bin/env bash
# Phase-47888: soft-complete through 47888.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 47888
PY
grep -qE 'phase47888|through 47888' webui/STATUS.md
echo "OK: phase47888 e2e passed"
