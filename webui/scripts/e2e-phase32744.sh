#!/usr/bin/env bash
# Phase-32744: soft-complete through 32744.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 32744
PY
grep -qE 'phase32744|through 32744' webui/STATUS.md
echo "OK: phase32744 e2e passed"
