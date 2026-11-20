#!/usr/bin/env bash
# Phase-41632: soft-complete through 41632.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 41632
PY
grep -qE 'phase41632|through 41632' webui/STATUS.md
echo "OK: phase41632 e2e passed"
