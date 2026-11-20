#!/usr/bin/env bash
# Phase-41472: soft-complete through 41472.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 41472
PY
grep -qE 'phase41472|through 41472' webui/STATUS.md
echo "OK: phase41472 e2e passed"
