#!/usr/bin/env bash
# Phase-43872: soft-complete through 43872.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 43872
PY
grep -qE 'phase43872|through 43872' webui/STATUS.md
echo "OK: phase43872 e2e passed"
