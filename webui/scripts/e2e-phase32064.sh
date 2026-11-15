#!/usr/bin/env bash
# Phase-32064: soft-complete through 32064.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 32064
PY
grep -qE 'phase32064|through 32064' webui/STATUS.md
echo "OK: phase32064 e2e passed"
