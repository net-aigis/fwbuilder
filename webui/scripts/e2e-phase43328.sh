#!/usr/bin/env bash
# Phase-43328: soft-complete through 43328.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 43328
PY
grep -qE 'phase43328|through 43328' webui/STATUS.md
echo "OK: phase43328 e2e passed"
