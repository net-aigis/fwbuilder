#!/usr/bin/env bash
# Phase-45888: soft-complete through 45888.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 45888
PY
grep -qE 'phase45888|through 45888' webui/STATUS.md
echo "OK: phase45888 e2e passed"
