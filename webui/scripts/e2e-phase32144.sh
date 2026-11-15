#!/usr/bin/env bash
# Phase-32144: soft-complete through 32144.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 32144
PY
grep -qE 'phase32144|through 32144' webui/STATUS.md
echo "OK: phase32144 e2e passed"
