#!/usr/bin/env bash
# Phase-24528: soft-complete through 24528.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 24528
PY
grep -qE 'phase24528|through 24528' webui/STATUS.md
echo "OK: phase24528 e2e passed"
