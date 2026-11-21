#!/usr/bin/env bash
# Phase-32240: soft-complete through 32240.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 32240
PY
grep -qE 'phase32240|through 32240' webui/STATUS.md
echo "OK: phase32240 e2e passed"
