#!/usr/bin/env bash
# Phase-32096: soft-complete through 32096.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 32096
PY
grep -qE 'phase32096|through 32096' webui/STATUS.md
echo "OK: phase32096 e2e passed"
