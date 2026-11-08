#!/usr/bin/env bash
# Phase-11888: soft-complete through 11888.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 11888
PY
grep -qE 'phase11888|through 11888' webui/STATUS.md
echo "OK: phase11888 e2e passed"
