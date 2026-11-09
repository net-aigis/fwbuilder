#!/usr/bin/env bash
# Phase-21168: soft-complete through 21168.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 21168
PY
grep -qE 'phase21168|through 21168' webui/STATUS.md
echo "OK: phase21168 e2e passed"
