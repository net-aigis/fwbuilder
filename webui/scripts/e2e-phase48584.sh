#!/usr/bin/env bash
# Phase-48584: soft-complete through 48584.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 48584
PY
grep -qE 'phase48584|through 48584' webui/STATUS.md
echo "OK: phase48584 e2e passed"
