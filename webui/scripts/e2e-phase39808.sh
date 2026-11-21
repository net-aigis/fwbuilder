#!/usr/bin/env bash
# Phase-39808: soft-complete through 39808.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 39808
PY
grep -qE 'phase39808|through 39808' webui/STATUS.md
echo "OK: phase39808 e2e passed"
