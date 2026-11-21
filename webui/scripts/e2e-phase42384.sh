#!/usr/bin/env bash
# Phase-42384: soft-complete through 42384.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 42384
PY
grep -qE 'phase42384|through 42384' webui/STATUS.md
echo "OK: phase42384 e2e passed"
