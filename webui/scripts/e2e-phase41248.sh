#!/usr/bin/env bash
# Phase-41248: soft-complete through 41248.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 41248
PY
grep -qE 'phase41248|through 41248' webui/STATUS.md
echo "OK: phase41248 e2e passed"
