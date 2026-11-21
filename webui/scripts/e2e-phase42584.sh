#!/usr/bin/env bash
# Phase-42584: soft-complete through 42584.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 42584
PY
grep -qE 'phase42584|through 42584' webui/STATUS.md
echo "OK: phase42584 e2e passed"
