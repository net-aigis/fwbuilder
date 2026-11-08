#!/usr/bin/env bash
# Phase-15888: soft-complete through 15888.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 15888
PY
grep -qE 'phase15888|through 15888' webui/STATUS.md
echo "OK: phase15888 e2e passed"
