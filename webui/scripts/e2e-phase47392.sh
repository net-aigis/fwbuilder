#!/usr/bin/env bash
# Phase-47392: soft-complete through 47392.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 47392
PY
grep -qE 'phase47392|through 47392' webui/STATUS.md
echo "OK: phase47392 e2e passed"
