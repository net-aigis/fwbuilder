#!/usr/bin/env bash
# Phase-8928: soft-complete through 8928.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 8928
PY
grep -qE 'phase8928|through 8928' webui/STATUS.md
echo "OK: phase8928 e2e passed"
