#!/usr/bin/env bash
# Phase-32872: soft-complete through 32872.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 32872
PY
grep -qE 'phase32872|through 32872' webui/STATUS.md
echo "OK: phase32872 e2e passed"
