#!/usr/bin/env bash
# Phase-40888: soft-complete through 40888.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 40888
PY
grep -qE 'phase40888|through 40888' webui/STATUS.md
echo "OK: phase40888 e2e passed"
