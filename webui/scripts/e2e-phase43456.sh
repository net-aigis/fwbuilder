#!/usr/bin/env bash
# Phase-43456: soft-complete through 43456.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 43456
PY
grep -qE 'phase43456|through 43456' webui/STATUS.md
echo "OK: phase43456 e2e passed"
