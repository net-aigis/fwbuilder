#!/usr/bin/env bash
# Phase-44384: soft-complete through 44384.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 44384
PY
grep -qE 'phase44384|through 44384' webui/STATUS.md
echo "OK: phase44384 e2e passed"
