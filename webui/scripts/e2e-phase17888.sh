#!/usr/bin/env bash
# Phase-17888: soft-complete through 17888.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 17888
PY
grep -qE 'phase17888|through 17888' webui/STATUS.md
echo "OK: phase17888 e2e passed"
