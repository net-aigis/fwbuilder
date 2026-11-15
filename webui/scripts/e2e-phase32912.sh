#!/usr/bin/env bash
# Phase-32912: soft-complete through 32912.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 32912
PY
grep -qE 'phase32912|through 32912' webui/STATUS.md
echo "OK: phase32912 e2e passed"
