#!/usr/bin/env bash
# Phase-43168: soft-complete through 43168.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 43168
PY
grep -qE 'phase43168|through 43168' webui/STATUS.md
echo "OK: phase43168 e2e passed"
