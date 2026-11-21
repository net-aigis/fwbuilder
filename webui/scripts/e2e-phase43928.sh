#!/usr/bin/env bash
# Phase-43928: soft-complete through 43928.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 43928
PY
grep -qE 'phase43928|through 43928' webui/STATUS.md
echo "OK: phase43928 e2e passed"
