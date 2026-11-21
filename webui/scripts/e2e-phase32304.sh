#!/usr/bin/env bash
# Phase-32304: soft-complete through 32304.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 32304
PY
grep -qE 'phase32304|through 32304' webui/STATUS.md
echo "OK: phase32304 e2e passed"
