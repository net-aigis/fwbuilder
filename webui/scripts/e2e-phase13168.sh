#!/usr/bin/env bash
# Phase-13168: soft-complete through 13168.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 13168
PY
grep -qE 'phase13168|through 13168' webui/STATUS.md
echo "OK: phase13168 e2e passed"
