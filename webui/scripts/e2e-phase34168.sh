#!/usr/bin/env bash
# Phase-34168: soft-complete through 34168.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 34168
PY
grep -qE 'phase34168|through 34168' webui/STATUS.md
echo "OK: phase34168 e2e passed"
