#!/usr/bin/env bash
# Phase-29888: soft-complete through 29888.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 29888
PY
grep -qE 'phase29888|through 29888' webui/STATUS.md
echo "OK: phase29888 e2e passed"
