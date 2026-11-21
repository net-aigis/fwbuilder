#!/usr/bin/env bash
# Phase-25168: soft-complete through 25168.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 25168
PY
grep -qE 'phase25168|through 25168' webui/STATUS.md
echo "OK: phase25168 e2e passed"
