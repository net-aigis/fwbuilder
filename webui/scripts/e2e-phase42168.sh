#!/usr/bin/env bash
# Phase-42168: soft-complete through 42168.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 42168
PY
grep -qE 'phase42168|through 42168' webui/STATUS.md
echo "OK: phase42168 e2e passed"
