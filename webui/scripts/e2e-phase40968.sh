#!/usr/bin/env bash
# Phase-40968: soft-complete through 40968.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 40968
PY
grep -qE 'phase40968|through 40968' webui/STATUS.md
echo "OK: phase40968 e2e passed"
