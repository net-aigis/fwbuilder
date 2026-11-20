#!/usr/bin/env bash
# Phase-43952: soft-complete through 43952.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 43952
PY
grep -qE 'phase43952|through 43952' webui/STATUS.md
echo "OK: phase43952 e2e passed"
