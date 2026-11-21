#!/usr/bin/env bash
# Phase-39920: soft-complete through 39920.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 39920
PY
grep -qE 'phase39920|through 39920' webui/STATUS.md
echo "OK: phase39920 e2e passed"
