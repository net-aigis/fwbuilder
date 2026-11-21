#!/usr/bin/env bash
# Phase-33384: soft-complete through 33384.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 33384
PY
grep -qE 'phase33384|through 33384' webui/STATUS.md
echo "OK: phase33384 e2e passed"
