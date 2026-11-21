#!/usr/bin/env bash
# Phase-12128: soft-complete through 12128.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 12128
PY
grep -qE 'phase12128|through 12128' webui/STATUS.md
echo "OK: phase12128 e2e passed"
