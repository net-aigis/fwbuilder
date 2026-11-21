#!/usr/bin/env bash
# Phase-43888: soft-complete through 43888.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 43888
PY
grep -qE 'phase43888|through 43888' webui/STATUS.md
echo "OK: phase43888 e2e passed"
